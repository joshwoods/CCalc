//
//  LoadItemsTableViewController.h
//  CCalc
//
//  Created by Josh Woods on 10/31/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedMenuItems.h"

@interface LoadItemsTableViewController : UITableViewController

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *savedItems;
@property (nonatomic, strong) SavedMenuItems *savedMenuItem;

@end
