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

@property (nonatomic, weak) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic, strong) CCMenuItem *editedMenuItem;

@end

@implementation EditMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.editedMenuItem = [[CCMenuItem alloc] init];
    for (CCIngredientItem *ingredient in self.menuItem.items) {
        [self.editedMenuItem addIngredientItem:ingredient];
    }
    
    NSLog(@"%lu", (unsigned long)[self.editedMenuItem.items count]);
    
    self.navigationItem.rightBarButtonItems = @[self.saveButton, self.editButtonItem];
    
}

- (IBAction)cancelAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"%lu", (unsigned long)[self.editedMenuItem.items count]);
    }];
}

- (IBAction)saveAction:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(updateMenuItemWithMenuItem:)])
    {
        [self.delegate updateMenuItemWithMenuItem:self.editedMenuItem];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.editedMenuItem.items.count > 0) {
        return [self.editedMenuItem.items count];
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (self.editedMenuItem.items.count > 0) {
        CCIngredientItem *item = self.editedMenuItem.items[indexPath.row];
        cell.textLabel.text = item.ingredientName;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else{
        cell.textLabel.text = @"No Items Available";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.editedMenuItem.items.count == 0 ? NO : YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView beginUpdates];
        [self.editedMenuItem.items removeObjectAtIndex:indexPath.row];
        NSLog(@"count %lu", (unsigned long)self.editedMenuItem.items.count);
        if (self.editedMenuItem.items.count == 0) {
            [self.navigationItem setRightBarButtonItems:@[self.saveButton] animated:YES];
            [tableView reloadData];
        } else {
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
        [tableView endUpdates];
        
        NSLog(@"There are %lu items in this menu", (unsigned long)[self.editedMenuItem.items count]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
