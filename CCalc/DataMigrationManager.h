//
//  DataMigrationManager.h
//  CCalc
//
//  Created by Josh Woods on 1/25/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface DataMigrationManager : NSObject <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

- (void)migrateData;

+ (DataMigrationManager *)sharedInstance;

@end
