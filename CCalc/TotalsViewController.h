//
//  TotalsViewController.h
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCMenuItem.h"
#import "EditMenuTableViewController.h"
@import CoreData;

@protocol TotalsDelegate
@optional
- (void)menuItemUpdated:(CCMenuItem *)menuItem;
- (void)menuItemSaved;
- (void)menuItemStartOver;
@end

@interface TotalsViewController : UITableViewController <UITextFieldDelegate, EditSummaryDelegate>

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSString *menuItemName;
@property (nonatomic, strong) CCMenuItem *menuItem;

@property (assign, nonatomic) NSObject <TotalsDelegate> *delegate;

@end
