//
//  SavedMealsViewController.m
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "SavedMealsViewController.h"
#import "SavedMealsDetailViewController.h"

@interface SavedMealsViewController ()

@property (nonatomic, assign) BOOL ableToUpdate;
@property (nonatomic, strong) SavedMenuItems *selectedSavedItem;

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

    
    // Create Fetched Results Controller
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        // Update to handle the error appropriately.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        exit(-1);  // Fail
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.fetchedResultsController.fetchedObjects.count != 0) {
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.fetchedResultsController.fetchedObjects.count > 0) {
        return self.fetchedResultsController.fetchedObjects.count;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.fetchedResultsController.fetchedObjects.count > 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        tableView.userInteractionEnabled = YES;
        
        SavedMenuItems *item = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
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
    if (self.fetchedResultsController.fetchedObjects.count == 0) {
        return;
    }
    
    self.selectedSavedItem = [self.fetchedResultsController objectAtIndexPath:indexPath];

    [self performSegueWithIdentifier:@"SavedDetailSegue" sender:self];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SavedDetailSegue"]) {
        SavedMealsDetailViewController *vc = [segue destinationViewController];
        vc.menuItem = self.selectedSavedItem;
    }
}

#pragma mark - Editing

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (self.fetchedResultsController.fetchedObjects.count == 0) ? NO : YES;;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        SavedMenuItems *favorite = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [self removeSavedItemWithMenuName:favorite.menuName];
        
        NSError *error;
        if (![[self fetchedResultsController] performFetch:&error]) {
            // Update to handle the error appropriately.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
        
        if (self.fetchedResultsController.fetchedObjects.count == 0) {
            NSLog(@"Zero");
            [self performSelector:@selector(handleEditState) withObject:nil afterDelay:1.0];
        }
    }
}

- (void)handleEditState
{
    [self.tableView setEditing:NO animated:YES];
}

- (void)removeSavedItemWithMenuName:(NSString *)menuName
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SavedMenuItems" inManagedObjectContext:managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"menuName == %@", menuName];
    [request setEntity:entity];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    
    NSArray *fetchedFavorites = [managedObjectContext executeFetchRequest:request error:&error];
    
    if (fetchedFavorites.count == 0)
    {
        NSLog(@"No objects found");

        return;
    }
    
    if (!error){
        NSLog(@"Removing %lu objects", (unsigned long)fetchedFavorites.count);
        for (NSManagedObject *savedItem in fetchedFavorites)
        {
            [managedObjectContext deleteObject:savedItem];
        }
    }
    else
    {
        NSLog(@"Error: %@", error);
    }
    
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
        else
        {
            //            NSLog(@"Successfully saved to iCloud store");
        }
    }
}

#pragma mark - FetchedResults Controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"SavedMenuItems" inManagedObjectContext:self.managedObjectContext]];
    
    NSSortDescriptor *titleDescriptor = [[NSSortDescriptor alloc] initWithKey:@"menuName" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    [fetchRequest setSortDescriptors:@[titleDescriptor]];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    _fetchedResultsController.delegate = self;
    
    NSError *error = nil;
    if (![_fetchedResultsController performFetch:&error]) {
        NSLog(@"Unhandled fetch request error: %@", error);
        NSAssert(NO, @"Unhandled fetch request error: %@", error);
    }
    
    return _fetchedResultsController;
}

#pragma mark - FetchedResults Controller Delegate

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView reloadData];
            break;
        case NSFetchedResultsChangeDelete:
            
            // At this point, the fetched object has already been removed
            // We either want to remove the row from the tableview
            // or if we have 0 objects, we want to reload and reflect that
            
            if (self.fetchedResultsController.fetchedObjects.count == 0) {
                self.navigationItem.rightBarButtonItem = nil;
                [tableView reloadData];
            } else {
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            
            break;
        case NSFetchedResultsChangeUpdate:
            [tableView reloadData];
            break;
        case NSFetchedResultsChangeMove:
            [tableView reloadData];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
