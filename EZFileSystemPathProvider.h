//  Created by Sergey Kovalenko on 11/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.


#import <Foundation/Foundation.h>

@interface EZFileSystemPathProvider : NSObject

+ (NSString *)applicationDocumentsDirectory;
+ (NSString *)applicationPrivateLibraryDirectory;

@end
