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

@interface BeansViewController ()

@property (nonatomic, strong) CCIngredientItem *fajitas;
@property (nonatomic, strong) CCIngredientItem *wRice;
@property (nonatomic, strong) CCIngredientItem *bRice;
@property (nonatomic, strong) CCIngredientItem *pBeans;
@property (nonatomic, strong) CCIngredientItem *bBeans;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *previousColor;

@property (nonatomic, strong) NSArray *arrayOfIngredients;

@property (nonatomic, assign) int itemsAddedInView;

@end

@implementation BeansViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _fajitas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeFajitas];
    _wRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeWRice];
    _bRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBRice];
    _pBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypePBeans];
    _bBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBBeans];
    
    _arrayOfIngredients = @[_fajitas, _wRice, _bRice, _bBeans, _pBeans];
    
    _color = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1];
}

- (IBAction)goBack:(UIStoryboardSegue *)segue
{
    //just unwinding here
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Meat Delegate
- (void)selectIngredient:(CCIngredientItem *)ingredient {
    if ([_delegate respondsToSelector:@selector(selectIngredient:)])
    {
        [_delegate selectIngredient:ingredient];
    }
}

- (void)removeBeanIngredient:(CCIngredientItem *)ingredient {
    if ([_delegate respondsToSelector:@selector(removeBeanIngredient:)])
    {
        [_delegate selectIngredient:ingredient];
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

//- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor pumpkinColor];
//}
//
//- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.contentView.backgroundColor = _previousColor;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self selectIngredient:_arrayOfIngredients[indexPath.row]];
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
