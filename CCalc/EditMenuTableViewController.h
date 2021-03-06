//
//  EditMenuTableViewController.h
//  CCalc
//
//  Created by Josh Woods on 10/21/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCMenuItem.h"
#import "CCIngredientItem.h"

@protocol EditSummaryDelegate

- (void)updateMenuItemWithMenuItem:(CCMenuItem *)menuItem;

@end

@interface EditMenuTableViewController : UITableViewController

@property (nonatomic, weak) CCMenuItem *menuItem;

// Delegate
@property (weak, nonatomic) NSObject <EditSummaryDelegate> *delegate;

@end
