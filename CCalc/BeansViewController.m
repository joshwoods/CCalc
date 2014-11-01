//
//  BeansViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "BeansViewController.h"
#import "SalsaViewController.h"
#import "EditMenuTableViewController.h"
#import "CCIngredientItem.h"
#import "UIColor+FlatUI.h"

@interface BeansViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) CCIngredientItem *fajitas;
@property (nonatomic, strong) CCIngredientItem *wRice;
@property (nonatomic, strong) CCIngredientItem *bRice;
@property (nonatomic, strong) CCIngredientItem *pBeans;
@property (nonatomic, strong) CCIngredientItem *bBeans;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@property (weak, nonatomic) IBOutlet UIButton *fajitasButton;
@property (weak, nonatomic) IBOutlet UIButton *wRiceButton;
@property (weak, nonatomic) IBOutlet UIButton *bRiceButton;
@property (weak, nonatomic) IBOutlet UIButton *pBeansButton;
@property (weak, nonatomic) IBOutlet UIButton *bBeansButton;

@property (nonatomic, assign) int itemsAddedInView;

@end

@implementation BeansViewController

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
    self.fajitasButton.tintColor = [UIColor pumpkinColor];
    self.wRiceButton.tintColor = [UIColor pumpkinColor];
    self.bRiceButton.tintColor = [UIColor pumpkinColor];
    self.pBeansButton.tintColor = [UIColor pumpkinColor];
    self.bBeansButton.tintColor = [UIColor pumpkinColor];
    self.navBar.barTintColor = [UIColor pumpkinColor];
    self.navBar.tintColor = [UIColor cloudsColor];
    [self.navBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor cloudsColor]}];
    
    self.fajitas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeFajitas];
    self.wRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeWRice];
    self.bRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBRice];
    self.pBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypePBeans];
    self.bBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBBeans];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"There are %lu items in this menu so far", [self.menuItem.items count]);
}

-(IBAction)fajitasPressed
{
    [self.menuItem addIngredientItem:self.fajitas];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)wRicePressed
{
    [self.menuItem addIngredientItem:self.wRice];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)bRicePressed
{
    [self.menuItem addIngredientItem:self.bRice];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)pBeansPressed
{
    [self.menuItem addIngredientItem:self.pBeans];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)bBeansPressed
{
    [self.menuItem addIngredientItem:self.bBeans];
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
    if([segue.identifier isEqualToString:@"beanItemSelected"])
    {
        SalsaViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
    }else if ([segue.identifier isEqualToString:@"editRiceSegue"]){
        UINavigationController *navController = segue.destinationViewController;
        EditMenuTableViewController *transferViewController = (EditMenuTableViewController *)navController.topViewController;
        transferViewController.menuItem = self.menuItem;
    }
}

@end
