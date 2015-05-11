//
//  InitialViewController.m
//  CCalc
//
//  Created by Josh Woods on 10/18/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "AppRootViewController.h"
#import "LoadItemsTableViewController.h"
#import "SavedMenuItems.h"
#import "UIColor+FlatUI.h"
#import "UIViewController+RRAdditions.h"

@interface AppRootViewController ()

@property (nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;

@end

@implementation AppRootViewController

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.createButton.tintColor = [UIColor pumpkinColor];
    self.loadButton.tintColor = [UIColor pumpkinColor];
    self.view.backgroundColor = [UIColor cloudsColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"SavedMenuItems"];
    self.savedItems = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    NSLog(@"%lu", (unsigned long)[_savedItems count]);
}

- (IBAction)beginningUnwind:(UIStoryboardSegue *)segue
{
    //Just unwinding
}

//- (void)blurBG{
//    self.image = [UIImage imageNamed:@"burrito"];
//    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    self.imageView.image = self.image;
//    visualEffectView.frame = self.imageView.bounds;
//    [self.imageView addSubview:visualEffectView];
//}

#pragma mark - Actions
- (IBAction)loadButtonPressed:(id)sender {
    UIStoryboard *load = [UIStoryboard storyboardWithName:@"Load Meals" bundle:nil];
    
    if (load != nil)
    {
        LoadItemsTableViewController *loadController = [load instantiateViewControllerWithIdentifier:@"LoadItemsTableViewController"];
        loadController.savedItems = _savedItems;
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loadController];
        [self presentViewController:navController animated:YES completion:nil];
    }
}

- (IBAction)newMealPressed:(id)sender {
    UIStoryboard *createStoryboard = [UIStoryboard storyboardWithName:@"CreateMealsRoot" bundle:nil];
    if (createStoryboard != nil) {
        CreateMealsRootViewController *createViewController = [createStoryboard instantiateInitialViewController];
        
        [self presentViewController:createViewController animated:YES completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
