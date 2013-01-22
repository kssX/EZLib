//
//  NSDictionary+NSNullAdditions.m
//  FindTheParty
//
//  Created by Maxim Romanov on 7/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+NSNullAdditions.h"

@implementation NSDictionary (NSNullAdditions)

- (id)nilOrObjectForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    
    if (object != [NSNull null]) {
        return object;
    } else {
        return nil;
    }
}

@end
