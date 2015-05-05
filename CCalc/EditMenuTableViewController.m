//
//  EditMenuTableViewController.m
//  CCalc
//
//  Created by Josh Woods on 10/21/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "EditMenuTableViewController.h"
#import "CCMenuItem.h"
#import "CCIngredientItem.h"
#import "UIColor+FlatUI.h"

@interface EditMenuTableViewController ()

@end

@implementation EditMenuTableViewController
{
    BOOL ableToUpdate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor cloudsColor];
    self.navigationController.navigationBar.barTintColor = [UIColor cloudsColor];
    if ([self.menuItem.items count] > 0) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
        ableToUpdate = YES;
    } else {
        self.navigationItem.rightBarButtonItem.enabled = NO;
        ableToUpdate = NO;
    }
    NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.menuItem.items.count > 0) {
        return [self.menuItem.items count];
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (self.menuItem.items.count > 0) {
        CCIngredientItem *item = self.menuItem.items[indexPath.row];
        cell.backgroundColor = [UIColor cloudsColor];
        cell.textLabel.text = item.nutrition.name;
        cell.textLabel.textColor = [UIColor pumpkinColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    } else{
        cell.textLabel.text = @"No Items Available";
        cell.backgroundColor = [UIColor cloudsColor];
        cell.textLabel.textColor = [UIColor pumpkinColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return ableToUpdate;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView beginUpdates];
        [self.menuItem.items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        if ([self.menuItem.items count] == 0) {
            ableToUpdate = NO;
            self.navigationItem.rightBarButtonItem.enabled = NO;
            [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
        [tableView endUpdates];
        [tableView reloadData];
        
        NSLog(@"There are %lu items in this menu", (unsigned long)[self.menuItem.items count]);
    }
}

@end
