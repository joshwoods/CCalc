//
//  CreateMealsRootViewController.h
//  CCalc
//
//  Created by Josh Woods on 5/3/15.
//  Copyright (c) 2015 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealViewController.h"
#import "MeatViewController.h"
#import "BeansViewController.h"
#import "SalsaViewController.h"
#import "CondimentViewController.h"
#import "CCMenuItem.h"

@interface CreateMealsRootViewController : UIViewController <MealViewDelegate, MeatViewDelegate, BeanViewDelegate, SalsaViewDelegate, CondimentViewDelegate>

@property (nonatomic, weak) IBOutlet UIView *sectionContainer;

//Containers
@property (nonatomic, weak) IBOutlet UIView *mealContainer;
@property (nonatomic, weak) IBOutlet UIView *meatContainer;
@property (nonatomic, weak) IBOutlet UIView *beansContainer;
@property (nonatomic, weak) IBOutlet UIView *salsaContainer;
@property (nonatomic, weak) IBOutlet UIView *miscContainer;

//Constraints
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *leadingMealConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *leadingMeatConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *leadingBeansConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *leadingSalsaConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *leadingMiscConstraint;

@property (nonatomic, weak) IBOutlet UILabel *caloriesLabel;

@property (nonatomic, strong) CCMenuItem *menuItem;

@end
