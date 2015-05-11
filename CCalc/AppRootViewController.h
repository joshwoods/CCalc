//
//  InitialViewController.h
//  CCalc
//
//  Created by Josh Woods on 10/18/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadItemsTableViewController.h"
#import "CreateMealsRootViewController.h"
@import CoreData;
@import iAd;

@interface AppRootViewController : UIViewController

//Ad
@property (nonatomic, weak) IBOutlet ADBannerView *adBanner;

//Array of saved meals
@property (nonatomic, strong) NSMutableArray *savedItems;

//Core Data
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

//Load Items Container
@property (nonatomic, weak) LoadItemsTableViewController *loadItemsController;
@property (nonatomic, weak) IBOutlet UIView *loadSaveMealsContainer;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *leadingSaveMealsConstraint;

@end
