//
//  InitialViewController.m
//  CCalc
//
//  Created by Josh Woods on 10/18/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "InitialViewController.h"
#import "LoadItemsTableViewController.h"
#import "SavedMenuItems.h"
#import "UIColor+FlatUI.h"

@interface InitialViewController ()

@property (nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;

@end

@implementation InitialViewController

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
    NSLog(@"%lu", (unsigned long)[self.savedItems count]);
}

- (IBAction)beginningUnwind:(UIStoryboardSegue *)segue
{
//    [self.savedItems removeAllObjects];
}

//- (void)blurBG{
//    self.image = [UIImage imageNamed:@"burrito"];
//    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    self.imageView.image = self.image;
//    visualEffectView.frame = self.imageView.bounds;
//    [self.imageView addSubview:visualEffectView];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"loadSavedItemsSegue"]) {
        UINavigationController *navController = segue.destinationViewController;
        LoadItemsTableViewController *controller = (LoadItemsTableViewController *)navController.topViewController;
        controller.savedItems = self.savedItems;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
