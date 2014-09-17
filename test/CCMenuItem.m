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
        nutrition.cal += item.nutrition.cal;
        nutrition.tFat += item.nutrition.tFat;
        nutrition.sf += item.nutrition.sf;
        nutrition.transf += item.nutrition.transf;
        nutrition.cho += item.nutrition.cho;
        nutrition.sod += item.nutrition.sod;
        nutrition.tc += item.nutrition.tc;
        nutrition.df += item.nutrition.df;
        nutrition.sug += item.nutrition.sug;
        nutrition.pro += item.nutrition.pro;
    }
    return nutrition;
}

-(CCNutrition *)aboutNutrition
{
    CCNutrition *about = [CCNutrition new];
    for(CCIngredientItem *item in self.aboutItem)
    {
        about.name = item.ingredientName;
        about.cal += item.nutrition.cal;
        about.tFat += item.nutrition.tFat;
        about.sf += item.nutrition.sf;
        about.transf += item.nutrition.transf;
        about.cho += item.nutrition.cho;
        about.sod += item.nutrition.sod;
        about.tc += item.nutrition.tc;
        about.df += item.nutrition.df;
        about.sug += item.nutrition.sug;
        about.pro += item.nutrition.pro;
    }
    return about;
}

@end
