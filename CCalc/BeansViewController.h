//
//  BeansViewController.h
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCIngredientItem.h"

@protocol BeanViewDelegate

- (void)selectIngredient:(CCIngredientItem *)ingredient;
- (void)removeBeanIngredient:(CCIngredientItem *)ingredient;

@end

@interface BeansViewController : UITableViewController <BeanViewDelegate>

// Delegate
@property (weak, nonatomic) NSObject <BeanViewDelegate> *delegate;

@end
