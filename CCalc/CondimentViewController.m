//
//  CondimentViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "CondimentViewController.h"
#import "SummaryViewController.h"
#import "EditMenuTableViewController.h"
#import "CCIngredientItem.h"
#import "UIColor+FlatUI.h"

@interface CondimentViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) CCIngredientItem *cheese;
@property (nonatomic, strong) CCIngredientItem *lettuce;
@property (nonatomic, strong) CCIngredientItem *guac;
@property (nonatomic, strong) CCIngredientItem *corn;
@property (nonatomic, strong) CCIngredientItem *sourCream;

@property (weak, nonatomic) IBOutlet UIButton *cheeseButton;
@property (weak, nonatomic) IBOutlet UIButton *lettuceButton;
@property (weak, nonatomic) IBOutlet UIButton *guacButton;
@property (weak, nonatomic) IBOutlet UIButton *cornButton;
@property (weak, nonatomic) IBOutlet UIButton *sourCreamButton;

@property (nonatomic, assign) int itemsAddedInView;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@end

@implementation CondimentViewController

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
    self.cheeseButton.tintColor = [UIColor pumpkinColor];
    self.lettuceButton.tintColor = [UIColor pumpkinColor];
    self.guacButton.tintColor = [UIColor pumpkinColor];
    self.cornButton.tintColor = [UIColor pumpkinColor];
    self.sourCreamButton.tintColor = [UIColor pumpkinColor];
    self.navBar.barTintColor = [UIColor pumpkinColor];
    self.navBar.tintColor = [UIColor cloudsColor];
    [self.navBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor cloudsColor]}];
    
    self.cheese = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCheese];
    self.corn = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCorn];
    self.guac = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeGuac];
    self.lettuce = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeLettuce];
    self.sourCream = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSourCream];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"There are %lu items in this menu so far", [self.menuItem.items count]);
}

-(IBAction)cheesePressed
{
    [self.menuItem addIngredientItem:self.cheese];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)guacPressed
{
    [self.menuItem addIngredientItem:self.guac];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)cornPressed
{
    [self.menuItem addIngredientItem:self.corn];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)lettucePressed
{
    [self.menuItem addIngredientItem:self.lettuce];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)sourCreamPressed
{
    [self.menuItem addIngredientItem:self.sourCream];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"condimentItemSelected"])
    {
        SummaryViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
    }else if ([segue.identifier isEqualToString:@"editCondimentSegue"]){
        UINavigationController *navController = segue.destinationViewController;
        EditMenuTableViewController *transferViewController = (EditMenuTableViewController *)navController.topViewController;
        transferViewController.menuItem = self.menuItem;
    }
}

@end
