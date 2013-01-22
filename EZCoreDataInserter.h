//
//  EZCoreDataInserter.h
//  FindTheParty
//
//  Created by Maxim Romanov on 7/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EZCoreDataInserter : NSObject

+ (id)accessObjectInContext:(NSManagedObjectContext *)context forEntityName:(NSString *)entityName uid:(NSString *)uid;

@end
