//
//  EZCoreDataInserter.m
//  FindTheParty
//
//  Created by Maxim Romanov on 7/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EZCoreDataInserter.h"

@implementation EZCoreDataInserter

+ (id)accessObjectInContext:(NSManagedObjectContext *)context forEntityName:(NSString *)entityName uid:(NSString *)uid
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    [request setPredicate:[NSPredicate predicateWithFormat:@"uid == %@", uid]];
    
    
    NSError *fetchError = nil;
    
    NSArray *fetchRequestResults = [context executeFetchRequest:request error:&fetchError];
    
    if (fetchRequestResults.count > 0) {
        return [fetchRequestResults lastObject];
    } else {
        return [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];

    }
}

@end
