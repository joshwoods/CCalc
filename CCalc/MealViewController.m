//
//  MainViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "MealViewController.h"
#import "CCMenuItem.h"
#import "CCIngredientItem.h"
#import "MeatViewController.h"
#import "EditMenuTableViewController.h"

#import "UIColor+FlatUI.h"

@interface MealViewController ()

@property (nonatomic, strong) CCIngredientItem *burrito;
@property (nonatomic, strong) CCIngredientItem *bowl;
@property (nonatomic, strong) CCIngredientItem *softTaco;
@property (nonatomic, strong) CCIngredientItem *hardTaco;

@property (nonatomic, assign) int itemsAddedInView;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *previousColor;

@property (nonatomic, strong) NSArray *arrayOfItems;

@end

@implementation MealViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.toolbarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _itemsAddedInView = 0;
    
    _burrito = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBurrito];
    _bowl = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBowl];
    _hardTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeHardTaco];
    _softTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSoftTaco];
    
    _arrayOfItems = @[_burrito, _bowl, _hardTaco, _softTaco];
    
    _color = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1];
    
    
}

- (IBAction)unwindFromEditView:(UIStoryboardSegue *)segue
{
    NSLog(@"Unwinding!");
}

#pragma mark - Meal Delegate
- (void)selectMealTypeWithType:(CCIngredientItem *)type {
    if ([_delegate respondsToSelector:@selector(selectMealTypeWithType:)])
    {
        [_delegate selectMealTypeWithType:type];
    }
}

- (void)removeMealWithType:(CCIngredientItem *)type {
    if ([_delegate respondsToSelector:@selector(removeMealWithType:)])
    {
        [_delegate removeMealWithType:type];
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
    
    [self removeMealWithType:_arrayOfItems[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = _previousColor;
    [UIView animateWithDuration:0.15 animations:^{
        cell.contentView.backgroundColor = [UIColor pumpkinColor];
    }];
    
    [self selectMealTypeWithType:_arrayOfItems[indexPath.row]];
    
    _itemsAddedInView++;
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
}

@end