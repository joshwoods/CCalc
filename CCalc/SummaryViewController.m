//
//  FinalViewController.m
//  CCalc
//
//  Created by Josh Woods on 2/20/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "SummaryViewController.h"
#import "EditMenuTableViewController.h"
#import "CCIngredientItem.h"
#import "SavedMenuItems.h"
#import "Ingredients.h"
#import "TableViewCell.h"
#import "UIColor+FlatUI.h"
#import "UITableViewCell+FlatUI.h"

@interface SummaryViewController () <UITextFieldDelegate>

@end

@implementation SummaryViewController

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
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
    self.navigationItem.title = @"Nutritional Information";
    
    self.tableView.backgroundColor = [UIColor cloudsColor];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    // Do any additional setup after loading the view.
    CCNutrition *nutrition = [CCNutrition new];
    nutrition = self.menuItem.nutritionTotal;
    
    NSLog(@"%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld",(long)self.menuItem.nutritionTotal.calories, (long)self.menuItem.nutritionTotal.totalFat,(long)self.menuItem.nutritionTotal.saturatedFat,(long)self.menuItem.nutritionTotal.transFat,(long)self.menuItem.nutritionTotal.cholesterol,(long)self.menuItem.nutritionTotal.sodium,(long)self.menuItem.nutritionTotal.totalCarbs,(long)self.menuItem.nutritionTotal.dietaryFiber,(long)self.menuItem.nutritionTotal.sugar,(long)self.menuItem.nutritionTotal.protein);
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
        return 3;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerText = (UITableViewHeaderFooterView *)view;
    headerText.textLabel.textColor = [UIColor asbestosColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *cellIdentifier = @"NutritionTableCell";
        TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.caloriesLabel.text = [NSString stringWithFormat:@"%ld", (long)self.menuItem.nutritionTotal.calories];
        cell.caloriesLabel.textColor = [UIColor pumpkinColor];
        cell.totalFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.totalFat];
        cell.totalFatLabel.textColor = [UIColor pumpkinColor];
        cell.saturatedFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.saturatedFat];
        cell.saturatedFatLabel.textColor = [UIColor pumpkinColor];
        cell.transFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.transFat];
        cell.transFatLabel.textColor = [UIColor pumpkinColor];
        cell.cholesterolLabel.text = [NSString stringWithFormat:@"%ld mg", (long)self.menuItem.nutritionTotal.cholesterol];
        cell.cholesterolLabel.textColor = [UIColor pumpkinColor];
        cell.sodiumLabel.text = [NSString stringWithFormat:@"%ld mg", (long)self.menuItem.nutritionTotal.sodium];
        cell.sodiumLabel.textColor = [UIColor pumpkinColor];
        cell.totalCarbsLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.totalCarbs];
        cell.totalCarbsLabel.textColor = [UIColor pumpkinColor];
        cell.dietaryFiberLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.dietaryFiber];
        cell.dietaryFiberLabel.textColor = [UIColor pumpkinColor];
        cell.sugarLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.sugar];
        cell.sugarLabel.textColor = [UIColor pumpkinColor];
        cell.proteinLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.protein];
        cell.proteinLabel.textColor = [UIColor pumpkinColor];
        [cell configureFlatCellWithColor:[UIColor cloudsColor] selectedColor:[UIColor pumpkinColor]];
        
        return cell;
    } else if (indexPath.section == 1 && indexPath.row == 0){
        static NSString *optionsIdentifier = @"EditCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:optionsIdentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:optionsIdentifier];
        cell.textLabel.text = @"Edit";
        [cell configureFlatCellWithColor:[UIColor cloudsColor] selectedColor:[UIColor pumpkinColor]];
        
        return cell;
    }else if (indexPath.section == 1 && indexPath.row == 1){
        static NSString *optionsIdentifier = @"SaveCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:optionsIdentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:optionsIdentifier];
        cell.textLabel.text = @"Save";
        [cell configureFlatCellWithColor:[UIColor cloudsColor] selectedColor:[UIColor pumpkinColor]];
        
        return cell;
    } else {
        static NSString *optionsIdentifier = @"SOCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:optionsIdentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:optionsIdentifier];
        cell.textLabel.text = @"Start Over";
        [cell configureFlatCellWithColor:[UIColor cloudsColor] selectedColor:[UIColor pumpkinColor]];
        
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
        if (indexPath.section == 1 && indexPath.row == 0) {
            [self performSegueWithIdentifier:@"editSummarySegue" sender:self];
        } else if (indexPath.section == 1 && indexPath.row == 1) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Name your meal:" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                NSManagedObjectContext *context = [self managedObjectContext];
                SavedMenuItems *savedInfo = [NSEntityDescription
                                             insertNewObjectForEntityForName:@"SavedMenuItems"
                                             inManagedObjectContext:context];
                savedInfo.menuName = self.menuItemName;
                savedInfo.calories = [NSString stringWithFormat:@"%ld",(long)self.menuItem.nutritionTotal.calories];
                savedInfo.totalFat = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.totalFat];
                savedInfo.saturatedFat = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.saturatedFat];
                savedInfo.transFat = [NSString stringWithFormat:@"%ld",(long)self.menuItem.nutritionTotal.transFat];
                savedInfo.cholesterol = [NSString stringWithFormat:@"%ld mg",(long)self.menuItem.nutritionTotal.cholesterol];
                savedInfo.sodium = [NSString stringWithFormat:@"%ld mg",(long)self.menuItem.nutritionTotal.sodium];
                savedInfo.totalCarbs = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.totalCarbs];
                savedInfo.dietaryFiber = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.dietaryFiber];
                savedInfo.sugar = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.sugar];
                savedInfo.protein = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.protein];
                for (CCIngredientItem *item in self.menuItem.items) {
                    Ingredients *ingredient = [NSEntityDescription insertNewObjectForEntityForName:@"Ingredients" inManagedObjectContext:context];
                    ingredient.ingredientName = item.nutrition.name;
                    ingredient.info = savedInfo;
                    [savedInfo addDetailsObject:ingredient];
                }
                
                NSError *error;
                if (![context save:&error]) {
                    NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
                }
            }];
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
                [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
                textField.delegate = self;
                textField.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:[NSDate date]]];
                self.menuItemName = textField.text;
            }];
            [alertController addAction:cancel];
            [alertController addAction:okay];
            alertController.view.tintColor = [UIColor pumpkinColor];
            [self presentViewController:alertController animated:YES completion:nil];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", str);
    self.menuItemName = str;
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editSummarySegue"]) {
        EditMenuTableViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
