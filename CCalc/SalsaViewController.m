//
//  SalsaViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "SalsaViewController.h"
#import "CCIngredientItem.h"
#import "CondimentViewController.h"
#import "EditMenuTableViewController.h"
#import "UIColor+FlatUI.h"

@interface SalsaViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) CCIngredientItem *tomato;
@property (nonatomic, strong) CCIngredientItem *tRed;
@property (nonatomic, strong) CCIngredientItem *tGreen;
@property (nonatomic, strong) CCIngredientItem *chili;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@property (weak, nonatomic) IBOutlet UIButton *tomatoButton;
@property (weak, nonatomic) IBOutlet UIButton *tRedButton;
@property (weak, nonatomic) IBOutlet UIButton *tGreenButton;
@property (weak, nonatomic) IBOutlet UIButton *chiliButton;

@property (nonatomic, assign) int itemsAddedInView;

@end

@implementation SalsaViewController

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
    self.tRedButton.tintColor = [UIColor pumpkinColor];
    self.tGreenButton.tintColor = [UIColor pumpkinColor];
    self.chiliButton.tintColor = [UIColor pumpkinColor];
    self.tomatoButton.tintColor = [UIColor pumpkinColor];
    self.navBar.barTintColor = [UIColor pumpkinColor];
    self.navBar.tintColor = [UIColor cloudsColor];
    [self.navBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor cloudsColor]}];
    
    self.tomato = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTomato];
    self.tRed = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTRed];
    self.tGreen = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTGreen];
    self.chili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChili];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"There are %lu items in this menu so far", [self.menuItem.items count]);
}

-(IBAction)tomatoPressed
{
    [self.menuItem addIngredientItem:self.tomato];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)tRedPressed
{
    [self.menuItem addIngredientItem:self.tRed];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)tGreenPressed
{
    [self.menuItem addIngredientItem:self.tGreen];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)chiliPressed
{
    [self.menuItem addIngredientItem:self.chili];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"salsaItemSelected"])
    {
        CondimentViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
    }else if ([segue.identifier isEqualToString:@"editSalsaSegue"]){
        UINavigationController *navController = segue.destinationViewController;
        EditMenuTableViewController *transferViewController = (EditMenuTableViewController *)navController.topViewController;
        transferViewController.menuItem = self.menuItem;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
