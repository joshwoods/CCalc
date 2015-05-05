//
//  MeatViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "MeatViewController.h"
#import "BeansViewController.h"
#import "MealViewController.h"
#import "EditMenuTableViewController.h"
#import "CCIngredientItem.h"
#import "UIColor+FlatUI.h"

@interface MeatViewController ()

@property (nonatomic, strong) CCIngredientItem *steak;
@property (nonatomic, strong) CCIngredientItem *chicken;
@property (nonatomic, strong) CCIngredientItem *carnitas;
@property (nonatomic, strong) CCIngredientItem *barbacoa;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *previousColor;

@property (nonatomic, strong) NSArray *arrayOfMeats;

@end

@implementation MeatViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _steak= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSteak];
    _chicken = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChicken];
    _barbacoa = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBarbacoa];
    _carnitas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCarnitas];
    
    _arrayOfMeats = @[_steak, _chicken, _carnitas, _barbacoa];
    
    _color = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(UIStoryboardSegue *)segue
{
    //just unwinding here
}

#pragma mark - Meat Delegate
- (void)selectMeatWithItem:(CCIngredientItem *)type {
    if ([_delegate respondsToSelector:@selector(selectMeatWithItem:)])
    {
        [_delegate selectMeatWithItem:type];
    }
}

- (void)removeMeatWithItem:(CCIngredientItem *)type {
    if ([_delegate respondsToSelector:@selector(selectMeatWithItem:)])
    {
        [_delegate removeMeatWithItem:type];
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
    
    [self removeMeatWithItem:_arrayOfMeats[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = _previousColor;
    [UIView animateWithDuration:0.15 animations:^{
        cell.contentView.backgroundColor = [UIColor pumpkinColor];
    }];
    
    [self selectMeatWithItem:_arrayOfMeats[indexPath.row]];
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

@end
