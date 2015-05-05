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

@interface SalsaViewController ()

@property (nonatomic, strong) CCIngredientItem *tomato;
@property (nonatomic, strong) CCIngredientItem *tRed;
@property (nonatomic, strong) CCIngredientItem *tGreen;
@property (nonatomic, strong) CCIngredientItem *chili;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *previousColor;

@end

@implementation SalsaViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cloudsColor];
    
    self.tomato = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTomato];
    self.tRed = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTRed];
    self.tGreen = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTGreen];
    self.chili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChili];
    
    _color = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"There are %lu items in this menu so far", (unsigned long)[self.menuItem.items count]);
}

- (IBAction)goBack:(UIStoryboardSegue *)segue
{
    //just unwinding here
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

#pragma mark - Table View Delegate Methods
-(UIColor*)colorForIndex:(NSInteger)index {
    if (index == 0) {
        return _color;
    } else {
        _color = [self darkerColorForColor:_color];
        return _color;
    }
}

- (UIColor *)darkerColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - 0.1, 0.0)
                               green:MAX(g - 0.1, 0.0)
                                blue:MAX(b - 0.1, 0.0)
                               alpha:a];
    return nil;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.15 animations:^{
        cell.contentView.backgroundColor = _previousColor;
    }];
    
    switch (indexPath.row) {
        case 0:
            [_menuItem removeIngredientItem:_tomato];
            break;
        case 1:
            [_menuItem removeIngredientItem:_tRed];
            break;
        case 2:
            [_menuItem removeIngredientItem:_tGreen];
            break;
        case 3:
            [_menuItem removeIngredientItem:_chili];
            break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = _previousColor;
    [UIView animateWithDuration:0.15 animations:^{
        cell.contentView.backgroundColor = [UIColor pumpkinColor];
    }];
    
    switch (indexPath.row) {
        case 0:
            [_menuItem addIngredientItem:_tomato];
            break;
        case 1:
            [_menuItem addIngredientItem:_tRed];
            break;
        case 2:
            [_menuItem addIngredientItem:_tGreen];
            break;
        case 3:
            [_menuItem addIngredientItem:_chili];
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.bounds.size.height/4;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [self colorForIndex:indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
