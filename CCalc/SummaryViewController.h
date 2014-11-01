//
//  FinalViewController.h
//  CCalc
//
//  Created by Josh Woods on 2/20/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCMenuItem.h"
@import CoreData;

@interface SummaryViewController : UITableViewController

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSString *menuItemName;
@property (nonatomic, strong) CCMenuItem *menuItem;

@end
