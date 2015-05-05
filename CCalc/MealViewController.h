//
//  MainViewController.h
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCIngredientItem.h"

@protocol MealViewDelegate

- (void)selectMealTypeWithType:(CCIngredientItem *)type;
- (void)removeMealWithType:(CCIngredientItem *)type;

@end

@interface MealViewController : UITableViewController

// Delegate
@property (weak, nonatomic) NSObject <MealViewDelegate> *delegate;

@end
