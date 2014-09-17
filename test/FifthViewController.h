//
//  FifthViewController.h
//  CCalc
//
//  Created by Josh Woods on 3/14/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCMenuItem.h"

@interface FifthViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *cheeseInfoButton;
@property (weak, nonatomic) IBOutlet UIButton *lettuceInfoButton;
@property (weak, nonatomic) IBOutlet UIButton *guacInfoButton;
@property (weak, nonatomic) IBOutlet UIButton *cornInfoButton;
@property (weak, nonatomic) IBOutlet UIButton *sourCreamInfoButton;
@property (weak, nonatomic) IBOutlet UIButton *startOver;

@property (weak, nonatomic) IBOutlet UIButton *cheeseAddButton;
@property (weak, nonatomic) IBOutlet UIButton *cheeseSubtractButton;
@property (weak, nonatomic) IBOutlet UIButton *lettuceAddButton;
@property (weak, nonatomic) IBOutlet UIButton *lettuceSubtractButton;
@property (weak, nonatomic) IBOutlet UIButton *cornAddButton;
@property (weak, nonatomic) IBOutlet UIButton *cornSubtractButton;
@property (weak, nonatomic) IBOutlet UIButton *guacAddButton;
@property (weak, nonatomic) IBOutlet UIButton *guacSubtractButton;
@property (weak, nonatomic) IBOutlet UIButton *sourCreamAddButton;
@property (weak, nonatomic) IBOutlet UIButton *sourCreamSubtractButton;

@property (nonatomic, weak) IBOutlet UILabel *cheeseSS;
@property (nonatomic, weak) IBOutlet UILabel *lettuceSS;
@property (nonatomic, weak) IBOutlet UILabel *guacSS;
@property (nonatomic, weak) IBOutlet UILabel *cornSS;
@property (nonatomic, weak) IBOutlet UILabel *sourCreamSS;
@property (weak, nonatomic) IBOutlet UILabel *cheeseBGLabel;
@property (weak, nonatomic) IBOutlet UILabel *lettuceBGLabel;
@property (weak, nonatomic) IBOutlet UILabel *guacBGLabel;
@property (weak, nonatomic) IBOutlet UILabel *cornBGLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourCreamBGLabel;

@property (nonatomic, strong) CCMenuItem *menuItem;
@property (nonatomic, strong) CCMenuItem *aboutMenuItem;
@property (nonatomic, strong) CCIngredientItem *cheese;
@property (nonatomic, strong) CCIngredientItem *lettuce;
@property (nonatomic, strong) CCIngredientItem *guac;
@property (nonatomic, strong) CCIngredientItem *corn;
@property (nonatomic, strong) CCIngredientItem *sourCream;

@end
