//
//  LoadItemsTableViewController.m
//  CCalc
//
//  Created by Josh Woods on 10/31/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import "LoadItemsTableViewController.h"
#import "LoadedDetailsTableViewController.h"
#import "UIColor+FlatUI.h"
#import "UITableViewCell+FlatUI.h"

@interface LoadItemsTableViewController ()

@end

@implementation LoadItemsTableViewController
{
    BOOL ableToUpdate;
}

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
    self.navigationController.navigationBar.barTintColor = [UIColor cloudsColor];
    if ([self.savedItems count] > 0) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
        ableToUpdate = YES;
    } else {
        self.navigationItem.rightBarButtonItem.enabled = NO;
        ableToUpdate = NO;
    }
    NSLog(@"%lu", [self.savedItems count]);
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (self.savedItems.count > 0) {
        return [self.savedItems count];
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if ([self.savedItems count] > 0) {
        SavedMenuItems *item = self.savedItems[indexPath.row];
        [cell configureFlatCellWithColor:[UIColor whiteColor] selectedColor:[UIColor pumpkinColor]];
        cell.textLabel.text = item.menuName;
        cell.textLabel.textColor = [UIColor pumpkinColor];
        // Configure the cell...
        return cell;
    } else {
        cell.textLabel.text = @"There are no saved items.";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor pumpkinColor];
        return cell;
    }
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return ableToUpdate;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObjectContext *context = [self managedObjectContext];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //delete the object from the database
        [context deleteObject:[self.savedItems objectAtIndex:indexPath.row]];
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        // Delete the row from the data source
        [tableView beginUpdates];
        [self.savedItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        if ([self.savedItems count] == 0) {
            ableToUpdate = NO;
            self.navigationItem.rightBarButtonItem.enabled = NO;
            [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
        [tableView endUpdates];
        [tableView reloadData];
        
        NSLog(@"There are %lu items in this menu", (unsigned long)[self.savedItems count]);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SelectedItemDetail"]) {
        self.savedMenuItem = [self.savedItems objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        LoadedDetailsTableViewController *controller = segue.destinationViewController;
        controller.menuItem = self.savedMenuItem;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
