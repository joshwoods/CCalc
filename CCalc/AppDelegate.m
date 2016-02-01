//
//  AppDelegate.m
//  CCalc
//
//  Created by Josh Woods on 10/27/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import "AppDelegate.h"
#import "SavedMenuItems.h"
#import "Ingredients.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "DataMigrationManager.h"
#import "Appirater.h"
#import "NewMealViewController.h"
#import "CJPAdController.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface AppDelegate ()

@end

#define kNewAction @"com.sdoowhsoj.ccalc.newmeal"
#define kSavedAction @"com.sdoowhsoj.ccalc.savedmeals"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Setup Ads
    if (![CJPAdController sharedInstance].adsRemoved) {
        [CJPAdController sharedInstance].adNetworks = @[@(CJPAdNetworkiAd), @(CJPAdNetworkAdMob)];
        [CJPAdController sharedInstance].adPosition = CJPAdPositionBottom;
        [CJPAdController sharedInstance].initialDelay = 2.0;
        [CJPAdController sharedInstance].testDeviceIDs = @[ @"e43f6c1fa56ac8fab97f316e3ed771a5" ];
        // AdMob specific
        [CJPAdController sharedInstance].adMobUnitID = @"ca-app-pub-3577357291971415/7028430681";
        
        [[CJPAdController sharedInstance] startWithViewController:self.window.rootViewController];
        self.window.rootViewController = [CJPAdController sharedInstance];
    }
    
    [[UITableViewCell appearance] setTintColor:[self colorWithHex:0xcc3800 alpha:1.0]];
    [[UIBarButtonItem appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBarTintColor:[self colorWithHex:0xcc3800 alpha:1.0]];
    [[UITabBar appearance] setTintColor:[self colorWithHex:0xd35400 alpha:1.0]];
    NSMutableDictionary *titleBarAttributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [titleBarAttributes setValue:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [[UINavigationBar appearance] setTitleTextAttributes:titleBarAttributes];
    _window.tintColor = [self colorWithHex:0xcc3800 alpha:1.0];

    [Fabric with:@[[Crashlytics class]]];
    
    [Appirater setAppId:@"848737175"];
    [Appirater setDaysUntilPrompt:2];
    [Appirater setUsesUntilPrompt:2];
    [Appirater setSignificantEventsUntilPrompt:-1];
    [Appirater setTimeBeforeReminding:1];
    [Appirater setDebug:NO];
    [Appirater appLaunched:YES];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"updateSavedItems"]) {
        [[DataMigrationManager sharedInstance] migrateData];
        [defaults setBool:YES forKey:@"updateSavedItems"];
    }
    [defaults synchronize];
    
    // Override point for customization after application launch.
    BOOL shouldPerformAdditionalDelegateHandling = YES;
    
    if ([application respondsToSelector:@selector(setShortcutItems:)])
    {
        if ([launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey])
        {
            _launchedShortcutItem = [launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey];
            
            // This will block "performActionForShortcutItem:completionHandler" from being called.
            shouldPerformAdditionalDelegateHandling = NO;
        }
    }

    
    return shouldPerformAdditionalDelegateHandling;
}

- (UIColor *)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
    
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    [Appirater appEnteredForeground:YES];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.joshwoods.CCalc" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CCalc" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CCalc.sqlite"];
    NSError *error = nil;
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = @"There was an error creating or loading the application's saved data.";
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (!coordinator) {
        return nil;
    }
    
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
    }
}

#pragma mark - Shortcuts

/*
 Called when the user activates your application by selecting a shortcut on the home screen, except when
 application(_:,willFinishLaunchingWithOptions:) or application(_:didFinishLaunchingWithOptions) returns `false`.
 You should handle the shortcut in those callbacks and return `false` if possible. In that case, this
 callback is used if your application is already launched in the background.
 */

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    BOOL handledShortcutItem = [self handleShortCutItem:shortcutItem];
    
    completionHandler(handledShortcutItem);
}

- (BOOL)handleShortCutItem:(UIApplicationShortcutItem *)shortcutItem
{
    BOOL handled = NO;
    
    if (shortcutItem == nil) {
        return handled;
    }
    
    NSInteger selectedIndex = 0;
    
    if ([shortcutItem.type isEqualToString:kNewAction]) {
        handled = YES;
        selectedIndex = 0;
    } else if ([shortcutItem.type isEqualToString:kSavedAction]) {
        handled = YES;
        selectedIndex = 1;
    }
    
    if (!IS_IPAD)
    {
        UITabBarController *tabController = (UITabBarController *)self.window.rootViewController;
        
        if (selectedIndex == 0) {
            UINavigationController *nav = [tabController.viewControllers objectAtIndex:0];
            NewMealViewController *vc = [nav.viewControllers objectAtIndex:0];
            [vc startOver];
        }
        
        [tabController setSelectedIndex:selectedIndex];
    }
    else
    {
        NSLog(@"Shortcuts not supported for iPad.....YET.");
    }
    
    return handled;
}

@end
