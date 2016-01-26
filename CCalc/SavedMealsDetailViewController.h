//
//  SavedMealsDetailViewController.h
//  CCalc
//
//  Created by Josh Woods on 1/22/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedMenuItems.h"
#import "Ingredients.h"
@import CoreData;

@interface SavedMealsDetailViewController : UITableViewController <UITextFieldDelegate>

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) SavedMenuItems *menuItem;
@property (nonatomic, strong) NSArray *ingredients;

@end
