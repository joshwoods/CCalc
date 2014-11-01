//
//  LoadedDetailsTableViewController.h
//  CCalc
//
//  Created by Josh Woods on 10/31/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedMenuItems.h"

@interface LoadedDetailsTableViewController : UITableViewController

@property (nonatomic, strong) SavedMenuItems *menuItem;

@end
