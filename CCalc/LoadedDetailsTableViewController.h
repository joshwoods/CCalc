//
//  LoadedDetailsTableViewController.h
//  CCalc
//
//  Created by Josh Woods on 10/31/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedMenuItems.h"
#import "Ingredients.h"

@interface LoadedDetailsTableViewController : UITableViewController

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) SavedMenuItems *menuItem;
@property (nonatomic, strong) NSArray *ingredients;

@end
