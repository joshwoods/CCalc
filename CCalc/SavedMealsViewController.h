//
//  SavedMealsViewController.h
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedMenuItems.h"
@import CoreData;

@interface SavedMealsViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) SavedMenuItems *savedMenuItem;

// Data
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
