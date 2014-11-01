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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor cloudsColor];
    self.title = self.menuItem.menuName;
    NSLog(@"%@", self.menuItem.calories);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    [cell configureFlatCellWithColor:[UIColor cloudsColor] selectedColor:nil];
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
