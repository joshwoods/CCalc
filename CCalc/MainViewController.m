//
//  MainViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "MainViewController.h"
#import "CCMenuItem.h"
#import "CCIngredientItem.h"
#import "MeatViewController.h"
#import "EditMenuTableViewController.h"

#import "UIColor+FlatUI.h"

@interface MainViewController () <UINavigationBarDelegate>

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@property (nonatomic, strong) CCMenuItem *menuItem;
@property (nonatomic, strong) CCIngredientItem *burrito;
@property (nonatomic, strong) CCIngredientItem *bowl;
@property (nonatomic, strong) CCIngredientItem *softTaco;
@property (nonatomic, strong) CCIngredientItem *hardTaco;
@property (weak, nonatomic) IBOutlet UIButton *burritoButton;
@property (weak, nonatomic) IBOutlet UIButton *bowlButton;
@property (weak, nonatomic) IBOutlet UIButton *hardTacoButton;
@property (weak, nonatomic) IBOutlet UIButton *softTacoButton;

@property (nonatomic, assign) int itemsAddedInView;

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (void)viewDidLoad {
    self.navBar.delegate = self;
    
    [super viewDidLoad];
    _itemsAddedInView = 0;
    self.view.backgroundColor = [UIColor cloudsColor];
    self.burritoButton.tintColor = [UIColor pumpkinColor];
    self.bowlButton.tintColor = [UIColor pumpkinColor];
    self.hardTacoButton.tintColor = [UIColor pumpkinColor];
    self.softTacoButton.tintColor = [UIColor pumpkinColor];
    self.navBar.barTintColor = [UIColor pumpkinColor];
    self.navBar.tintColor = [UIColor cloudsColor];
    [self.navBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor cloudsColor]}];
    
    
    self.menuItem = [[CCMenuItem alloc] init];
    self.burrito = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBurrito];
    self.bowl = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBowl];
    self.hardTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeHardTaco];
    self.softTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSoftTaco];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"There are %lu items in this menu so far", [self.menuItem.items count]);
}

#pragma mark - IBActions

- (IBAction)refresh:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        [self.menuItem.items removeAllObjects];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (IBAction)burritoPressed
{
    [self.menuItem addIngredientItem:self.burrito];
    _itemsAddedInView++;
    NSLog(@"%i", _itemsAddedInView);
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)bowlPressed
{
    [self.menuItem addIngredientItem:self.bowl];
    _itemsAddedInView++;
    NSLog(@"%i", _itemsAddedInView);
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)softPressed
{
    [self.menuItem addIngredientItem:self.softTaco];
    _itemsAddedInView++;
    NSLog(@"%i", _itemsAddedInView);
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)hardPressed
{
    [self.menuItem addIngredientItem:self.hardTaco];
    _itemsAddedInView++;
    NSLog(@"%i", _itemsAddedInView);
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)goBack:(id)sender {
    [self.menuItem.items removeAllObjects];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)unwindToRootVC:(UIStoryboardSegue *)segue
{
    [self.menuItem.items removeAllObjects];
}

- (IBAction)unwindFromEditView:(UIStoryboardSegue *)segue
{
    NSLog(@"Unwinding!");
}

//#pragma mark - UINavigationBarDelegate
//
//- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
//{
//    return UIBarPositionTopAttached;
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"mealTypeSelected"]){
        MeatViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
    } else if ([segue.identifier isEqualToString:@"editMealSegue"]){
        UINavigationController *navController = segue.destinationViewController;
        EditMenuTableViewController *transferViewController = (EditMenuTableViewController *)navController.topViewController;
        transferViewController.menuItem = self.menuItem;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end