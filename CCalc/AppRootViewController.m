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
    
    _adBanner.delegate = self;
    
    _adBanner.alpha = 0.0;
    
    [self loadChildViewControllers];
}

- (void)loadChildViewControllers {
    
    UIStoryboard *loadStoryboard = [UIStoryboard storyboardWithName:@"Load Meals" bundle:nil];
    
    if (loadStoryboard != nil)
    {
        UINavigationController *navigationController = [loadStoryboard instantiateInitialViewController];
        [UIViewController addChildViewController:navigationController toParentViewController:self andAddToView:_loadSaveMealsContainer keepPreviousChildren:nil andRemoveAllOtherChildren:NO withAutoLayout:YES];
        _leadingSaveMealsConstraint.constant = -self.view.bounds.size.width;
    }
    
    
    UIStoryboard *createStoryboard = [UIStoryboard storyboardWithName:@"CreateMealsRoot" bundle:nil];
    
    if (createStoryboard != nil)
    {
        _createMealsController = [createStoryboard instantiateInitialViewController];
        [UIViewController addChildViewController:_createMealsController toParentViewController:self andAddToView:_createMealContainer keepPreviousChildren:nil andRemoveAllOtherChildren:NO withAutoLayout:YES];
        _leadingCreateMealsConstraint.constant = self.view.bounds.size.width;
    }
    
    [self.view layoutIfNeeded];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"loadSavedItemsSegue"]) {
        UINavigationController *navController = segue.destinationViewController;
        LoadItemsTableViewController *controller = (LoadItemsTableViewController *)navController.topViewController;
        controller.savedItems = self.savedItems;
    }
}

#pragma mark - Actions
- (IBAction)loadButtonPressed:(id)sender {
    _leadingSaveMealsConstraint.constant = 0.0;
    
    [UIView animateWithDuration:0.35
                          delay: 0.0
                        options: (UIViewAnimationOptionCurveEaseOut)
                     animations:^{
                         
                         [self.view layoutIfNeeded];
                         
                     } completion:nil];
}

- (IBAction)newMealPressed:(id)sender {
    _leadingCreateMealsConstraint.constant = 0.0;
    
    [UIView animateWithDuration:0.35
                          delay: 0.0
                        options: (UIViewAnimationOptionCurveEaseOut)
                     animations:^{
                         
                         [self.view layoutIfNeeded];
                         
                     } completion:nil];
}

#pragma mark - Ad Delegate Methods
-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad Banner will load ad.");
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad Banner did load ad.");
    
    [UIView animateWithDuration:0.35 animations:^{
        _adBanner.alpha = 1.0;
    }];
}

-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    NSLog(@"Ad Banner action is about to begin.");
    
    return YES;
}

-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
    NSLog(@"Ad Banner action did finish");
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"Unable to show ads. Error: %@", [error localizedDescription]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
