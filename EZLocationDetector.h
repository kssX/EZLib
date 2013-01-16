//
//  FPLocationDetector.h
//  FindTheParty
//
//  Created by Sergey Kovalenko on 1/9/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^LocationDetectedBlock)(CLLocation *detectedLocation);
typedef void (^LocationFailedToDetectBlock)(NSError *error);

@interface EZLocationDetector : NSObject
+ (EZLocationDetector *)sharedDetector;

- (void)updateLocationWithCompletionHandler:(LocationDetectedBlock)locationDetectedHandler errorHandler:(LocationFailedToDetectBlock)errorHandler;

@end
