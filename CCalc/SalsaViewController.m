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

@property (nonatomic, strong) NSArray *arrayOfSalsa;

@end

@implementation SalsaViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cloudsColor];
    
    _tomato = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTomato];
    _tRed = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTRed];
    _tGreen = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTGreen];
    _chili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChili];
    
    _arrayOfSalsa = @[_tomato, _tRed, _tGreen, _chili];
    
    _color = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1];
}

- (IBAction)goBack:(UIStoryboardSegue *)segue
{
    //just unwinding here
}

#pragma mark - Salsa Delegate
- (void)selectSalsaIngredient:(CCIngredientItem *)ingredient {
    if ([_delegate respondsToSelector:@selector(selectSalsaIngredient:)])
    {
        [_delegate selectSalsaIngredient:ingredient];
    }
}

- (void)removeSalsaIngredient:(CCIngredientItem *)ingredient {
    if ([_delegate respondsToSelector:@selector(removeSalsaIngredient:)])
    {
        [_delegate removeSalsaIngredient:ingredient];
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
    
    [self removeSalsaIngredient:_arrayOfSalsa[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = _previousColor;
    [UIView animateWithDuration:0.15 animations:^{
        cell.contentView.backgroundColor = [UIColor pumpkinColor];
    }];
    
    [self selectSalsaIngredient:_arrayOfSalsa[indexPath.row]];
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
