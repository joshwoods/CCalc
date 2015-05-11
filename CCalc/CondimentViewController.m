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

@property (nonatomic, strong) UIColor *first;
@property (nonatomic, strong) UIColor *second;
@property (nonatomic, strong) UIColor *third;
@property (nonatomic, strong) UIColor *fourth;
@property (nonatomic, strong) UIColor *fifth;

@property (nonatomic, strong) NSArray *arrayOfCondiments;

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
    
    _arrayOfCondiments = @[_cheese, _corn, _guac, _lettuce, _sourCream];
    
    _color = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Condiment Delegate
- (void)setSummaryColor:(UIColor *)color {
    if ([_delegate respondsToSelector:@selector(setSummaryColor:)])
    {
        [_delegate setSummaryColor:color];
    }
}

- (void)selectCondimentIngredient:(CCIngredientItem *)ingredient {
    if ([_delegate respondsToSelector:@selector(selectCondimentIngredient:)])
    {
        [_delegate selectCondimentIngredient:ingredient];
    }
}

- (void)removeCondimentIngredient:(CCIngredientItem *)ingredient {
    if ([_delegate respondsToSelector:@selector(removeCondimentIngredient:)])
    {
        [_delegate removeCondimentIngredient:ingredient];
    }
}

#pragma mark - Table View Delegate Methods
-(UIColor*)colorForIndex:(NSInteger)index {
    if (index == 0) {
        return _color;
    } else {
        _color = [self darkerColorForColor:_color];
        
        switch (index) {
            case 0:
                _first = _color;
                break;
            case 1:
                _second = _color;
                break;
            case 2:
                _third = _color;
                break;
            case 3:
                _fourth = _color;
                break;
            case 4:
                _fifth = _color;
                [self setSummaryColor:_fifth];
                break;
            default:
                break;
        }
        
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 6) {
        cell.userInteractionEnabled = NO;
    }
    [UIView animateWithDuration:0.25 animations:^{
        cell.backgroundColor = [UIColor pumpkinColor];
    }];
    [self selectCondimentIngredient:_arrayOfCondiments[indexPath.row]];
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 6) {
        cell.userInteractionEnabled = NO;
    }
    [UIView animateWithDuration:0.25 animations:^{
        switch (indexPath.row) {
            case 0:
                cell.backgroundColor = _first;
                break;
            case 1:
                cell.backgroundColor = _second;
                break;
            case 2:
                cell.backgroundColor = _third;
                break;
            case 3:
                cell.backgroundColor = _fourth;
                break;
            case 4:
                cell.backgroundColor = _fifth;
                break;
            default:
                break;
        }
    }];
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    [self removeCondimentIngredient:_arrayOfCondiments[indexPath.row]];
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
