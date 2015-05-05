//
//  MeatViewController.h
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCIngredientItem.h"

@protocol MeatViewDelegate

- (void)selectMeatWithItem:(CCIngredientItem *)type;
- (void)removeMeatWithItem:(CCIngredientItem *)type;

@end

@interface MeatViewController : UITableViewController <MeatViewDelegate>

// Delegate
@property (weak, nonatomic) NSObject <MeatViewDelegate> *delegate;

@end
