//
//  SalsaViewController.h
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCIngredientItem.h"

@protocol SalsaViewDelegate

- (void)selectSalsaIngredient:(CCIngredientItem *)ingredient;
- (void)removeSalsaIngredient:(CCIngredientItem *)ingredient;

@end

@interface SalsaViewController : UITableViewController <SalsaViewDelegate>

// Delegate
@property (weak, nonatomic) NSObject <SalsaViewDelegate> *delegate;

@end
