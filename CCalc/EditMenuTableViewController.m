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

@interface EditMenuTableViewController ()

@property (nonatomic, strong) UIBarButtonItem *saveButton;

@end

@implementation EditMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%lu", (unsigned long)[_menuItem.items count]);
    
    self.saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
    
    self.navigationItem.rightBarButtonItems = @[self.saveButton, self.editButtonItem];
    
}

- (IBAction)cancelAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveAction
{
    if ([self.delegate respondsToSelector:@selector(updateMenuItemWithMenuItem:)])
    {
        [self.delegate updateMenuItemWithMenuItem:self.menuItem];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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
        CCIngredientItem *item = _menuItem.items[indexPath.row];
        cell.textLabel.text = item.nutrition.name;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else{
        cell.textLabel.text = @"No Items Available";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.menuItem.items.count == 0 ? NO : YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView beginUpdates];
        [self.menuItem.items removeObjectAtIndex:indexPath.row];
        NSLog(@"count %lu", (unsigned long)self.menuItem.items.count);
        if (self.menuItem.items.count == 0) {
            [self.navigationItem setRightBarButtonItems:@[self.saveButton] animated:YES];
            [tableView reloadData];
        } else {
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
        [tableView endUpdates];
        
        NSLog(@"There are %lu items in this menu", (unsigned long)[_menuItem.items count]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
