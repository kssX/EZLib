//  Created by kssX on 6/18/12.


//example of usage
/*
+ (EZNetworkConnection *)yandexForwardGeocodeAddress:(NSString *)searchString completionBlock:(void (^)(NSArray *geocodedResults))completionBlock errorHandler:(void (^)(NSError *error))errorBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://geocode-maps.yandex.ru/1.x/?format=json&geocode=%@", [searchString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];
    
    __block EZNetworkConnection *con = [EZNetworkConnection sendRequest:request responseHandler:^(NSHTTPURLResponse *response) {
        //NSLog(@"%d", response.statusCode);
        switch (response.statusCode) {
            case 200:
                
                break;
                
                //any code except 200 is unknown error
            default:
                errorBlock(nil);
                [con cancelConnection];
                break;
        }
    } completionHandler:^(NSData *loadedData) {
        [SomeParser parseYandexGeocodedData:loadedData completionHandler:^(NSArray *decodedAddresses) {
            completionBlock(decodedAddresses);
        } failureHandler:^(NSError *error) {
            errorBlock(error);
        }];
    } errorHandler:^(NSError *error) {
        errorBlock(error);
    }];
    
    return con;
    
}
*/




#import <Foundation/Foundation.h>

typedef void (^ResponseHandlerBlock)(NSHTTPURLResponse *response);
typedef void (^LoadedDataHandlerBlock)(NSData *loadedData);
typedef void (^ConnectionErrorHandlerBlock)(NSError *error);

@interface EZNetworkConnection : NSObject

+ (EZNetworkConnection *)sendRequest:(NSMutableURLRequest *)request responseHandler:(ResponseHandlerBlock)responseHandler completionHandler:(LoadedDataHandlerBlock)completionHandler errorHandler:(ConnectionErrorHandlerBlock)errorHandler;

- (void)cancelConnection;
@end