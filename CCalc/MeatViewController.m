//
//  MeatViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "MeatViewController.h"
#import "BeansViewController.h"
#import "MainViewController.h"
#import "EditMenuTableViewController.h"
#import "CCIngredientItem.h"
#import "UIColor+FlatUI.h"

@interface MeatViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) CCIngredientItem *steak;
@property (nonatomic, strong) CCIngredientItem *chicken;
@property (nonatomic, strong) CCIngredientItem *carnitas;
@property (nonatomic, strong) CCIngredientItem *barbacoa;

@property (weak, nonatomic) IBOutlet UIButton *steakButton;
@property (weak, nonatomic) IBOutlet UIButton *chickenButton;
@property (weak, nonatomic) IBOutlet UIButton *barbacoaButton;
@property (weak, nonatomic) IBOutlet UIButton *carnitasButton;

@property (nonatomic, assign) int itemsAddedInView;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@end

@implementation MeatViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _itemsAddedInView = 0;
    self.navBar.delegate = self;

    self.view.backgroundColor = [UIColor cloudsColor];
    self.steakButton.tintColor = [UIColor pumpkinColor];
    self.chickenButton.tintColor = [UIColor pumpkinColor];
    self.barbacoaButton.tintColor = [UIColor pumpkinColor];
    self.carnitasButton.tintColor = [UIColor pumpkinColor];
    self.navBar.barTintColor = [UIColor pumpkinColor];
    self.navBar.tintColor = [UIColor cloudsColor];
    [self.navBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor cloudsColor]}];
    
    self.steak= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSteak];
    self.chicken= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChicken];
    self.barbacoa= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBarbacoa];
    self.carnitas= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCarnitas];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"There are %lu items in this menu so far", [self.menuItem.items count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)steakPressed
{
    [self.menuItem addIngredientItem:self.steak];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)chickenPressed
{
    
    [self.menuItem addIngredientItem:self.chicken];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)barbacoaPressed
{
    [self.menuItem addIngredientItem:self.barbacoa];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)carnitasPressed
{
    [self.menuItem addIngredientItem:self.carnitas];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"meatItemSelected"])
    {
        BeansViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
    }else if ([segue.identifier isEqualToString:@"editMeatSegue"]){
        UINavigationController *navController = segue.destinationViewController;
        EditMenuTableViewController *transferViewController = (EditMenuTableViewController *)navController.topViewController;
        transferViewController.menuItem = self.menuItem;
    }
}

@end
