//
//  CCMenuItem.m
//  CCalc
//
//  Created by Josh Woods on 3/1/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "CCMenuItem.h"

@interface CCMenuItem ()

@end

@implementation CCMenuItem

-(void)addIngredientItem:(CCIngredientItem *)ingredient
{
    [self.items addObject:ingredient];
}

-(void)removeIngredientItem:(CCIngredientItem *)ingredient
{
    [self.items removeObject:ingredient];
}

-(void)addAboutItem:(CCIngredientItem *)ingredient
{
    [self.aboutItem addObject:ingredient];
}

-(void)removeAboutItem:(CCIngredientItem *)ingredient
{
    [self.aboutItem removeObject:ingredient];
}

-(void)startOver
{
    [self.items removeAllObjects];
}

- (BOOL)isIngredientInMenu:(CCIngredientItem *)item
{
    if (self.items.count > 0) {
        for (CCIngredientItem *ingredient in self.items) {
            if ([item.ingredientName isEqualToString:ingredient.ingredientName]) {
                return YES;
            }
        }
    }
    
    return NO;
}

-(id)init
{
    self = [super init];
    if(self)
    {
        _items = [[NSMutableArray alloc] init];
        _aboutItem = [[NSMutableArray alloc] init];
    }
    return self;
}

-(CCNutrition *)nutritionTotal
{
    CCNutrition *nutrition = [CCNutrition new];
    for(CCIngredientItem *item in self.items)
    {
        nutrition.calories += item.nutrition.calories;
        nutrition.totalFat += item.nutrition.totalFat;
        nutrition.saturatedFat += item.nutrition.saturatedFat;
        nutrition.transFat += item.nutrition.transFat;
        nutrition.cholesterol += item.nutrition.cholesterol;
        nutrition.sodium += item.nutrition.sodium;
        nutrition.totalCarbs += item.nutrition.totalCarbs;
        nutrition.dietaryFiber += item.nutrition.dietaryFiber;
        nutrition.sugar += item.nutrition.sugar;
        nutrition.protein += item.nutrition.protein;
    }
    return nutrition;
}

-(CCNutrition *)aboutNutrition
{
    CCNutrition *about = [CCNutrition new];
    for(CCIngredientItem *item in self.aboutItem)
    {
        about.name = item.ingredientName;
        about.calories += item.nutrition.calories;
        about.totalFat += item.nutrition.totalFat;
        about.saturatedFat += item.nutrition.saturatedFat;
        about.transFat += item.nutrition.transFat;
        about.cholesterol += item.nutrition.cholesterol;
        about.sodium += item.nutrition.sodium;
        about.totalCarbs += item.nutrition.totalCarbs;
        about.dietaryFiber += item.nutrition.dietaryFiber;
        about.sugar += item.nutrition.sugar;
        about.protein += item.nutrition.protein;
    }
    return about;
}

@end
