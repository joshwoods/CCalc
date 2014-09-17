//
//  FinalViewController.h
//  CCalc
//
//  Created by Josh Woods on 2/20/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCMenuItem.h"

@interface SummaryViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *finalCalLabel;
@property (nonatomic, weak) IBOutlet UILabel *finalTFatLabel;
@property (nonatomic, weak) IBOutlet UILabel *finalSfLabel;
@property (nonatomic, weak) IBOutlet UILabel *finalTransfLabel;
@property (nonatomic, weak) IBOutlet UILabel *finalChoLabel;
@property (nonatomic, weak) IBOutlet UILabel *finalSodLabel;
@property (nonatomic, weak) IBOutlet UILabel *finalTcLabel;
@property (nonatomic, weak) IBOutlet UILabel *finalDfLabel;
@property (nonatomic, weak) IBOutlet UILabel *finalSugLabel;
@property (nonatomic, weak) IBOutlet UILabel *finalProLabel;

@property (nonatomic, weak) IBOutlet UILabel *totalFatPercentLabel;
@property (nonatomic, weak) IBOutlet UILabel *saturatedFatPercentLabel;
@property (nonatomic, weak) IBOutlet UILabel *cholesterolPercentLabel;
@property (nonatomic, weak) IBOutlet UILabel *sodiumPercentLabel;
@property (nonatomic, weak) IBOutlet UILabel *carbsPercentLabel;
@property (nonatomic, weak) IBOutlet UILabel *fiberPercentLabel;

@property (weak, nonatomic) IBOutlet UIButton *startOverButton;

@property (nonatomic, strong) CCMenuItem *menuItem;

@end
