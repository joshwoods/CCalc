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

@interface CondimentViewController ()

@property (nonatomic, strong) CCIngredientItem *cheese;
@property (nonatomic, strong) CCIngredientItem *lettuce;
@property (nonatomic, strong) CCIngredientItem *guac;
@property (nonatomic, strong) CCIngredientItem *corn;
@property (nonatomic, strong) CCIngredientItem *sourCream;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *previousColor;

@end

@implementation CondimentViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cloudsColor];
    
    _cheese = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCheese];
    _corn = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCorn];
    _guac = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeGuac];
    _lettuce = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeLettuce];
    _sourCream = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSourCream];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"condimentItemSelected"])
    {
        SummaryViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = _menuItem;
    }else if ([segue.identifier isEqualToString:@"editCondimentSegue"]){
        UINavigationController *navController = segue.destinationViewController;
        EditMenuTableViewController *transferViewController = (EditMenuTableViewController *)navController.topViewController;
        transferViewController.menuItem = _menuItem;
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
            [_menuItem removeIngredientItem:_cheese];
            break;
        case 1:
            [_menuItem removeIngredientItem:_guac];
            break;
        case 2:
            [_menuItem removeIngredientItem:_corn];
            break;
        case 3:
            [_menuItem removeIngredientItem:_lettuce];
            break;
        case 4:
            [_menuItem removeIngredientItem:_sourCream];
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
            [_menuItem addIngredientItem:_cheese];
            break;
        case 1:
            [_menuItem addIngredientItem:_guac];
            break;
        case 2:
            [_menuItem addIngredientItem:_corn];
            break;
        case 3:
            [_menuItem addIngredientItem:_lettuce];
            break;
        case 4:
            [_menuItem addIngredientItem:_sourCream];
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.bounds.size.height/5;
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
    return 5;
}

@end
