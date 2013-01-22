//
//  KSSCoreDataTableViewController.h
//  WishGenie
//
//  Created by serk on 2/17/12.
//  Copyright (c) 2012 WishGenie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface KSSCoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@end
