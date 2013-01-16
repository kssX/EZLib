//  Created by kssX on 1/9/13.


#import "EZLocationDetector.h"


#define LOCATION_EXPIRATION_LIMIT 30.0

@interface EZLocationDetector() <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocation *currentUserLocation;
@property (nonatomic, strong) NSDate *locationDetectionTimeStamp;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic) BOOL isUpdatingLocation;
@property (nonatomic, strong) NSMutableArray *completionBlocks;
@property (nonatomic, strong) NSMutableArray *errorBlocks;
@end

@implementation EZLocationDetector

+ (EZLocationDetector *)sharedDetector
{
    static EZLocationDetector *sharedDetector = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedDetector = [[EZLocationDetector alloc] init];
    });
    
    return sharedDetector;
}

- (NSMutableArray *)completionBlocks
{
    if (!_completionBlocks) {
        _completionBlocks = [NSMutableArray array];
    }
    return _completionBlocks;
}

- (NSMutableArray *)errorBlocks
{
    if (!_errorBlocks) {
        _errorBlocks = [NSMutableArray array];
    }
    return _errorBlocks;
}


- (void)addBlockToCompletionArray:(LocationDetectedBlock)block
{
    [self.completionBlocks addObject:[block copy]];
}

- (void)addBlockToErrorArray:(LocationFailedToDetectBlock)block
{
    [self.errorBlocks addObject:[block copy]];
}

- (void)updateLocationWithCompletionHandler:(LocationDetectedBlock)locationDetectedHandler errorHandler:(LocationFailedToDetectBlock)errorHandler
{
    //check if location services enabled
    if (![CLLocationManager locationServicesEnabled]) {
        errorHandler(nil);
        return;
    }
    
    if (self.locationDetectionTimeStamp && abs([self.locationDetectionTimeStamp timeIntervalSinceNow]) < LOCATION_EXPIRATION_LIMIT) {
        locationDetectedHandler(self.currentUserLocation);
    }
    else {
        [self addBlockToCompletionArray:locationDetectedHandler];
        [self addBlockToErrorArray:errorHandler];
        
        if (!self.isUpdatingLocation) {
            [self.locationManager startUpdatingLocation];
        }
    }
}


- (void)performCompletionHandlersWithLocation:(CLLocation *)location
{
    for (LocationDetectedBlock block in self.completionBlocks) {
        block(location);
    }
    [self cleanCompletionArrays];
}

- (void)performErrorHandlersWithError:(NSError *)error
{
    for (LocationFailedToDetectBlock block in self.errorBlocks) {
        block(error);
    }
    
    [self cleanCompletionArrays];
}

- (void)cleanCompletionArrays
{
    [self.completionBlocks removeAllObjects];
    [self.errorBlocks removeAllObjects];
}

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        [_locationManager setDelegate:self];
    }
    
    return _locationManager;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < LOCATION_EXPIRATION_LIMIT) {
        self.currentUserLocation = location;
        self.locationDetectionTimeStamp = eventDate;
        [self performCompletionHandlersWithLocation:location];
        [self.locationManager stopUpdatingLocation];
    }
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self performErrorHandlersWithError:error];
}

@end
