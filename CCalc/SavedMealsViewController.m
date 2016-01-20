//
//  SavedMealsViewController.m
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "SavedMealsViewController.h"

@interface SavedMealsViewController ()

@property (nonatomic, assign) BOOL ableToUpdate;

@end

@implementation SavedMealsViewController

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
    
    if ([self.savedItems count] > 0) {
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
        self.ableToUpdate = YES;
    } else {
        self.ableToUpdate = NO;
    }
    
    self.navigationItem.rightBarButtonItem.enabled = self.ableToUpdate;
    
    NSLog(@"%lu", (unsigned long)[_savedItems count]);
    [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.savedItems.count > 0) {
        return [self.savedItems count];
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.savedItems count] > 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        tableView.userInteractionEnabled = YES;
        SavedMenuItems *item = self.savedItems[indexPath.row];
        cell.textLabel.text = item.menuName;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Calories: %@", item.calories];
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoItemsCell" forIndexPath:indexPath];
        tableView.userInteractionEnabled = NO;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.savedItems.count == 0) {
        return;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Editing

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return self.ableToUpdate;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
