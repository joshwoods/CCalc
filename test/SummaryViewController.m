//
//  FinalViewController.m
//  CCalc
//
//  Created by Josh Woods on 2/20/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "SummaryViewController.h"
#import "TableViewCell.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

-(IBAction)startOverButtonPressed
{
    [self.menuItem.items removeAllObjects];
}

//
//-(void)setDailyValueLabels
//{
//    self.totalFatPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.totalFat*100)/65)];
//    self.saturatedFatPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.saturatedFat*100)/20)];
//    self.cholesterolPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.cholesterol*100)/300)];
//    self.sodiumPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.sodium*100)/2400)];
//    self.carbsPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.totalCarbs*100)/300)];
//    self.fiberPercentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)((self.menuItem.nutritionTotal.dietaryFiber*100)/25)];
//}

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
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    // Do any additional setup after loading the view.
    CCNutrition *nutrition = [CCNutrition new];
    nutrition = self.menuItem.nutritionTotal;
    
    NSLog(@"%ld", (long)self.menuItem.nutritionTotal.calories);
    NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 297;
    } else {
        return 44;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *cellIdentifier = @"NutritionTableCell";
        TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.caloriesLabel.text = [NSString stringWithFormat:@"%ld", (long)self.menuItem.nutritionTotal.calories];
        cell.totalFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.totalFat];
        cell.saturatedFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.saturatedFat];
        cell.transFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.transFat];
        cell.cholesterolLabel.text = [NSString stringWithFormat:@"%ld mg", (long)self.menuItem.nutritionTotal.cholesterol];
        cell.sodiumLabel.text = [NSString stringWithFormat:@"%ld mg", (long)self.menuItem.nutritionTotal.sodium];
        cell.totalCarbsLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.totalCarbs];
        cell.dietaryFiberLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.dietaryFiber];
        cell.sugarLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.sugar];
        cell.proteinLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.protein];
        
        return cell;
    } else if (indexPath.section == 1 && indexPath.row == 0){
        static NSString *optionsIdentifier = @"SaveCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:optionsIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:optionsIdentifier];
        }
        cell.textLabel.text = @"Save";
        return cell;
    } else {
        static NSString *optionsIdentifier = @"SOCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:optionsIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:optionsIdentifier];
        }
        cell.textLabel.text = @"Start Over";
        return cell;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return nil;
    } else {
        return indexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.userInteractionEnabled = NO;
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
