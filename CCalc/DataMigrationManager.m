//
//  DataMigrationManager.m
//  CCalc
//
//  Created by Josh Woods on 1/25/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "DataMigrationManager.h"
#import "AppDelegate.h"

@interface DataMigrationManager ()
- (id)initSharedInstance;

@end

// Singleton Macro
#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject; \

@implementation DataMigrationManager

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark - Singleton Methods

// singleton initialization
+ (DataMigrationManager *)sharedInstance
{
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    });
}

// only the designated initializer will call [super init]
// pass the init to your own method with an override here
- (id)init
{
    return [self initSharedInstance];
}

- (id)initSharedInstance {
    
    if (self = [super init])
    {

    }
    
    return self;
}

@end
