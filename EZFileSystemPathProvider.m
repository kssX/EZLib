//  Created by Sergey Kovalenko on 11/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.


#import "EZFileSystemPathProvider.h"

@implementation EZFileSystemPathProvider

+ (NSString *)applicationDocumentsDirectory 
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)applicationPrivateLibraryDirectory
{
    return   [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

@end
