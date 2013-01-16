//  Created by kssX on 6/18/12.

#import "EZNetworkConnection.h"

@interface EZNetworkConnection()
@property (nonatomic, copy) ResponseHandlerBlock responseHandler;
@property (nonatomic, copy) LoadedDataHandlerBlock loadedDataHandler;
@property (nonatomic, copy) ConnectionErrorHandlerBlock errorHandler;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *receivedData;
@end

@implementation EZNetworkConnection
@synthesize responseHandler = _responseHandler;
@synthesize loadedDataHandler = _loadedDataHandler;
@synthesize errorHandler = _errorHandler;
@synthesize connection = _connection;
@synthesize receivedData = _receivedData;


- (void)cancelConnection
{
    [self.connection cancel];
    self.connection = nil;
    self.errorHandler = nil;
    self.responseHandler = nil;
    self.loadedDataHandler = nil;
}


+ (EZNetworkConnection *)sendRequest:(NSMutableURLRequest *)request responseHandler:(ResponseHandlerBlock)responseHandler completionHandler:(LoadedDataHandlerBlock)completionHandler errorHandler:(ConnectionErrorHandlerBlock)errorHandler
{
    EZNetworkConnection *connection = [[EZNetworkConnection alloc] init];
    connection.responseHandler = responseHandler;
    connection.errorHandler = errorHandler;
    connection.loadedDataHandler = completionHandler;
    connection.connection = [[NSURLConnection alloc] initWithRequest:request delegate:connection startImmediately:YES];   
    connection.receivedData = [NSMutableData data];
    
    return connection;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.responseHandler((NSHTTPURLResponse *)response);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.errorHandler(error);
    [connection cancel];
    self.connection = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{   
    self.loadedDataHandler(self.receivedData);
    self.connection = nil;
}

@end
