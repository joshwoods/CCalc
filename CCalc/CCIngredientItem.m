//
//  CCIngredientItem.m
//  CCalc
//
//  Created by Josh Woods on 3/1/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "CCIngredientItem.h"

@implementation CCIngredientItem

+(id)new
{
    CCIngredientItem *ingredient = [[CCIngredientItem alloc] init];
    ingredient.nutrition = [[CCNutrition alloc] init];
    return ingredient;
}

+(instancetype)ingredientItemWithType:(CCIngredientItemType)type
{
    CCIngredientItem *item = [CCIngredientItem new];
    switch (type) {
        case CCIngredientItemTypeBurrito:
        {
            item.nutrition.name = @"Burrito";
            item.nutrition.calories = 300;
            item.nutrition.totalFat = 10;
            item.nutrition.saturatedFat = 1;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol =0;
            item.nutrition.sodium = 690;
            item.nutrition.totalCarbs = 6;
            item.nutrition.dietaryFiber = 3;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 7;
        } break;
        case CCIngredientItemTypeBowl:
        {
            item.nutrition.name = @"Bowl";
            item.nutrition.calories = 0;
            item.nutrition.totalFat = 0;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 0;
            item.nutrition.totalCarbs = 0;
            item.nutrition.dietaryFiber = 0;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 0;
        } break;
        case CCIngredientItemTypeHardTaco:
        {
            item.nutrition.name = @"Hard Taco";
            item.nutrition.calories = 210;
            item.nutrition.totalFat = 8;
            item.nutrition.saturatedFat = 3;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 30;
            item.nutrition.totalCarbs = 30;
            item.nutrition.dietaryFiber = 6;
            item.nutrition.sugar = 3;
            item.nutrition.protein = 3;
        } break;
        case CCIngredientItemTypeSoftTaco:
        {
            item.nutrition.name = @"Soft Taco";
            item.nutrition.calories = 210;
            item.nutrition.totalFat = 0;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 30;
            item.nutrition.totalCarbs = 45;
            item.nutrition.dietaryFiber = 6;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 3;
        } break;
        case CCIngredientItemTypeSteak:
        {
            item.nutrition.name = @"Steak";
            item.nutrition.calories = 190;
            item.nutrition.totalFat = 7;
            item.nutrition.saturatedFat = 2;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 65;
            item.nutrition.sodium = 320;
            item.nutrition.totalCarbs = 2;
            item.nutrition.dietaryFiber = 0;
            item.nutrition.sugar = 1;
            item.nutrition.protein = 30;
        } break;
        case CCIngredientItemTypeChicken:
        {
            item.nutrition.name = @"Chicken";
            item.nutrition.calories = 180;
            item.nutrition.totalFat = 7;
            item.nutrition.saturatedFat = 3;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 125;
            item.nutrition.sodium = 310;
            item.nutrition.totalCarbs = 0;
            item.nutrition.dietaryFiber = 1;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 32;
        } break;
        case CCIngredientItemTypeCarnitas:
        {
            item.nutrition.name = @"Carnitas";
            item.nutrition.calories = 220;
            item.nutrition.totalFat = 13;
            item.nutrition.saturatedFat = 6;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 65;
            item.nutrition.sodium = 500;
            item.nutrition.totalCarbs = 1;
            item.nutrition.dietaryFiber = 0;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 26;
        } break;
        case CCIngredientItemTypeBarbacoa:
        {
            item.nutrition.name = @"Barbacoa";
            item.nutrition.calories = 165;
            item.nutrition.totalFat = 7;
            item.nutrition.saturatedFat = 3;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 65;
            item.nutrition.sodium = 530;
            item.nutrition.totalCarbs = 2;
            item.nutrition.dietaryFiber = 1;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 24;
        } break;
        case CCIngredientItemTypeTomato:
        {
            item.nutrition.name = @"Tomato Salsa";
            item.nutrition.calories = 20;
            item.nutrition.totalFat = 0;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 500;
            item.nutrition.totalCarbs = 4;
            item.nutrition.dietaryFiber = 1;
            item.nutrition.sugar = 3;
            item.nutrition.protein = 1;
        } break;
        case CCIngredientItemTypeTRed:
        {
            item.nutrition.name = @"Tomatillo-Red Salsa";
            item.nutrition.calories = 25;
            item.nutrition.totalFat = 1;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 500;
            item.nutrition.totalCarbs = 4;
            item.nutrition.dietaryFiber = 2;
            item.nutrition.sugar = 1;
            item.nutrition.protein = 1;
        } break;
        case CCIngredientItemTypeTGreen:
        {
            item.nutrition.name = @"Tomatillo-Green Salsa";
            item.nutrition.calories = 20;
            item.nutrition.totalFat = 0;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 250;
            item.nutrition.totalCarbs = 4;
            item.nutrition.dietaryFiber = 1;
            item.nutrition.sugar = 2;
            item.nutrition.protein = 1;
        } break;
        case CCIngredientItemTypeChili:
        {
            item.nutrition.name = @"Roasted Chili Salsa";
            item.nutrition.calories = 80;
            item.nutrition.totalFat = 2;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 330;
            item.nutrition.totalCarbs = 16;
            item.nutrition.dietaryFiber = 3;
            item.nutrition.sugar = 4;
            item.nutrition.protein = 3;
        } break;
        case CCIngredientItemTypeWRice:
        {
            item.nutrition.name = @"White Rice";
            item.nutrition.calories = 185;
            item.nutrition.totalFat = 4;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 375;
            item.nutrition.totalCarbs = 34;
            item.nutrition.dietaryFiber = 1;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 4;
        } break;
        case CCIngredientItemTypeBRice:
        {
            item.nutrition.name = @"Brown Rice";
            item.nutrition.calories = 200;
            item.nutrition.totalFat = 7;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 165;
            item.nutrition.totalCarbs = 32;
            item.nutrition.dietaryFiber = 3;
            item.nutrition.sugar = 1;
            item.nutrition.protein = 4;
        } break;
        case CCIngredientItemTypePBeans:
        {
            item.nutrition.name = @"Pinto Beans";
            item.nutrition.calories = 115;
            item.nutrition.totalFat = 1;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 300;
            item.nutrition.totalCarbs = 21;
            item.nutrition.dietaryFiber = 10;
            item.nutrition.sugar = 1;
            item.nutrition.protein = 6;
        } break;
        case CCIngredientItemTypeBBeans:
        {
            item.nutrition.name = @"Black Beans";
            item.nutrition.calories = 120;
            item.nutrition.totalFat = 1;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 260;
            item.nutrition.totalCarbs = 22;
            item.nutrition.dietaryFiber = 12;
            item.nutrition.sugar = 1;
            item.nutrition.protein = 7;
        } break;
        case CCIngredientItemTypeFajitas:
        {
            item.nutrition.name = @"Fajitas";
            item.nutrition.calories = 20;
            item.nutrition.totalFat = 1;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 170;
            item.nutrition.totalCarbs = 4;
            item.nutrition.dietaryFiber = 1;
            item.nutrition.sugar = 2;
            item.nutrition.protein = 1;
        } break;
        case CCIngredientItemTypeCheese:
        {
            item.nutrition.name = @"Cheese";
            item.nutrition.calories = 100;
            item.nutrition.totalFat = 8;
            item.nutrition.saturatedFat = 5;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 30;
            item.nutrition.sodium = 190;
            item.nutrition.totalCarbs = 1;
            item.nutrition.dietaryFiber = 0;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 6;
        } break;
        case CCIngredientItemTypeCorn:
        {
            item.nutrition.name = @"Corn";
            item.nutrition.calories = 330;
            item.nutrition.totalFat = 4;
            item.nutrition.saturatedFat = 1;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0 ;
            item.nutrition.sodium = 29;
            item.nutrition.totalCarbs = 62;
            item.nutrition.dietaryFiber = 0;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 8;
        } break;
        case CCIngredientItemTypeGuac:
        {
            item.nutrition.name = @"Guacamole";
            item.nutrition.calories = 170;
            item.nutrition.totalFat = 16;
            item.nutrition.saturatedFat = 3;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 410;
            item.nutrition.totalCarbs = 8;
            item.nutrition.dietaryFiber = 18;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 2;
        } break;
        case CCIngredientItemTypeLettuce:
        {
            item.nutrition.name = @"Lettuce";
            item.nutrition.calories = 5;
            item.nutrition.totalFat = 0;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 0;
            item.nutrition.totalCarbs = 1;
            item.nutrition.dietaryFiber = 1;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 0;
        } break;
            
        case CCIngredientItemTypeSourCream:
        {
            item.nutrition.name = @"Sour Cream";
            item.nutrition.calories = 115;
            item.nutrition.totalFat =  10;
            item.nutrition.saturatedFat = 7;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 40;
            item.nutrition.sodium = 30;
            item.nutrition.totalCarbs = 1;
            item.nutrition.dietaryFiber = 0;
            item.nutrition.sugar = 2;
            item.nutrition.protein = 2;
        } break;
            
    }
    
    return item;
}

@end
