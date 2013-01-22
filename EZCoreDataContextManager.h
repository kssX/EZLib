#import <Foundation/Foundation.h>

@interface EZCoreDataContextManager : NSObject
+ (NSManagedObjectContext *)sharedManagedObjectContext;
+ (NSManagedObjectContext *)draftManagedObjectContext;
+ (NSManagedObjectContext *)freshContext;
@end
