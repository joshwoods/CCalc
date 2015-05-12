//
//  LoadedDetailsTableViewController.m
//  CCalc
//
//  Created by Josh Woods on 10/31/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import "LoadedDetailsTableViewController.h"
#import "TableViewCell.h"
#import "UIColor+FlatUI.h"
#import "UITableViewCell+FlatUI.h"

@interface LoadedDetailsTableViewController ()

@end

@implementation LoadedDetailsTableViewController

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ingredients = [_menuItem.details allObjects];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    self.tableView.backgroundColor = [UIColor cloudsColor];
    
    self.title = _menuItem.menuName;
    
    NSLog(@"%@", _menuItem.calories);
}

#pragma mark - Table view data source

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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Nutritional Information";
    } else {
        return @"Ingredients";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        return [_ingredients count];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerText = (UITableViewHeaderFooterView *)view;
    headerText.textLabel.textColor = [UIColor asbestosColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nutritionCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"nutritionCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"nutritionCell"];
        }
        cell.backgroundColor = [UIColor cloudsColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.caloriesLabel.text = [self.menuItem valueForKey:@"calories"];
        cell.caloriesLabel.textColor = [UIColor pumpkinColor];
        cell.totalFatLabel.text = [self.menuItem valueForKey:@"totalFat"];
        cell.totalFatLabel.textColor = [UIColor pumpkinColor];
        cell.saturatedFatLabel.text = [self.menuItem valueForKey:@"saturatedFat"];
        cell.saturatedFatLabel.textColor = [UIColor pumpkinColor];
        cell.transFatLabel.text = [self.menuItem valueForKey:@"transFat"];
        cell.transFatLabel.textColor = [UIColor pumpkinColor];
        cell.cholesterolLabel.text = [self.menuItem valueForKey:@"cholesterol"];
        cell.cholesterolLabel.textColor = [UIColor pumpkinColor];
        cell.sodiumLabel.text = [self.menuItem valueForKey:@"sodium"];
        cell.sodiumLabel.textColor = [UIColor pumpkinColor];
        cell.totalCarbsLabel.text = [self.menuItem valueForKey:@"totalCarbs"];
        cell.totalCarbsLabel.textColor = [UIColor pumpkinColor];
        cell.dietaryFiberLabel.text = [self.menuItem valueForKey:@"dietaryFiber"];
        cell.dietaryFiberLabel.textColor = [UIColor pumpkinColor];
        cell.sugarLabel.text = [self.menuItem valueForKey:@"sugar"];
        cell.sugarLabel.textColor = [UIColor pumpkinColor];
        cell.proteinLabel.text = [self.menuItem valueForKey:@"protein"];
        cell.proteinLabel.textColor = [UIColor pumpkinColor];
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.backgroundColor = [UIColor cloudsColor];
        cell.textLabel.textColor = [UIColor pumpkinColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSManagedObjectContext *context = [self managedObjectContext];
        Ingredients *ingredient = [NSEntityDescription insertNewObjectForEntityForName:@"Ingredients" inManagedObjectContext:context];
        if ([self.ingredients count] > 0) {
            ingredient = self.ingredients[indexPath.row];
            cell.textLabel.text = ingredient.ingredientName;
            return cell;
        } else {
            cell.textLabel.text = @"None";
            return cell;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
