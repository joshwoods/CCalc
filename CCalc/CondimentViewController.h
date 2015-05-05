//
//  CondimentViewController.h
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCIngredientItem.h"

@protocol CondimentViewDelegate

- (void)setSummaryColor:(UIColor *)color;
- (void)selectCondimentIngredient:(CCIngredientItem *)ingredient;
- (void)removeCondimentIngredient:(CCIngredientItem *)ingredient;

@end

@interface CondimentViewController : UITableViewController <CondimentViewDelegate>

// Delegate
@property (weak, nonatomic) NSObject <CondimentViewDelegate> *delegate;

@end
