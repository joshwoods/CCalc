//
//  FinalViewController.m
//  CCalc
//
//  Created by Josh Woods on 2/20/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

-(IBAction)startOverButtonPressed
{
    [self.menuItem.items removeAllObjects];
}

-(IBAction)goBack
{
    [[self navigationController] popViewControllerAnimated:YES];
}

-(void)setNutritionLabels
{
    self.finalCalLabel.text = [NSString stringWithFormat:@"%ld", (long)self.menuItem.nutritionTotal.cal];
    self.finalTFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.tFat];
    self.finalSfLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.sf];
    self.finalTransfLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.transf];
    self.finalChoLabel.text = [NSString stringWithFormat:@"%ld mg", (long)self.menuItem.nutritionTotal.cho];
    self.finalSodLabel.text = [NSString stringWithFormat:@"%ld mg", (long)self.menuItem.nutritionTotal.sod];
    self.finalTcLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.tc];
    self.finalDfLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.df];
    self.finalSugLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.sug];
    self.finalProLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.pro];
}

-(void)setDailyValueLabels
{
    self.totalFatPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.tFat*100)/65)];
    self.saturatedFatPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.sf*100)/20)];
    self.cholesterolPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.cho*100)/300)];
    self.sodiumPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.sod*100)/2400)];
    self.carbsPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.tc*100)/300)];
    self.fiberPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.df*100)/25)];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CCNutrition *nutrition = [CCNutrition new];
    nutrition = self.menuItem.nutritionTotal;
    
    [self setNutritionLabels];
    [self setDailyValueLabels];
    
    NSLog(@"%ld", (long)self.menuItem.nutritionTotal.cal);
    NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
