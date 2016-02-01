//
//  NewMealViewController.h
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCMenuItem.h"
#import "TotalsViewController.h"

@interface NewMealViewController : UITableViewController <TotalsDelegate>

@property (nonatomic, strong) CCMenuItem *menuItem;

- (void)startOver;

@end
