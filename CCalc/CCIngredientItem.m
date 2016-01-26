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
            item.oldIngredientName = @"Burrito";
            item.nutrition.name = @"Burrito";
            item.ingredientName = item.nutrition.name;
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
        case CCIngredientItemTypeSalad:
        {
            item.oldIngredientName = @"salad";
            item.nutrition.name = @"Salad";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 10;
            item.nutrition.totalFat = 0;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 0;
            item.nutrition.totalCarbs = 2;
            item.nutrition.dietaryFiber = 1;
            item.nutrition.sugar = 1;
            item.nutrition.protein = 1;
        } break;
        case CCIngredientItemTypeBowl:
        {
            item.oldIngredientName = @"Bowl";
            item.nutrition.name = @"Burrito Bowl";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Hard Taco";
            item.nutrition.name = @"Crispy Corn Tortilla Taco";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Soft Taco";
            item.nutrition.name = @"Soft Corn Tortilla Taco";
            item.ingredientName = item.nutrition.name;
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
        case CCIngredientItemTypeSoftFlourTaco:
        {
            item.oldIngredientName = @"softflour";
            item.nutrition.name = @"Soft Flour Tortilla Taco";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 255;
            item.nutrition.totalFat = 8;
            item.nutrition.saturatedFat = 3;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 570;
            item.nutrition.totalCarbs = 39;
            item.nutrition.dietaryFiber = 2;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 6;
        } break;
        case CCIngredientItemTypeSteak:
        {
            item.oldIngredientName = @"Steak";
            item.nutrition.name = @"Steak";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Chicken";
            item.nutrition.name = @"Chicken";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Carnitas";
            item.nutrition.name = @"Carnitas";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 210;
            item.nutrition.totalFat = 12;
            item.nutrition.saturatedFat = 7;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 65;
            item.nutrition.sodium = 450;
            item.nutrition.totalCarbs = 0;
            item.nutrition.dietaryFiber = 0;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 23;
        } break;
        case CCIngredientItemTypeBarbacoa:
        {
            item.oldIngredientName = @"Barbacoa";
            item.nutrition.name = @"Barbacoa";
            item.ingredientName = item.nutrition.name;
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
        case CCIngredientItemTypeSofritas:
        {
            item.oldIngredientName = @"Sofritas";
            item.nutrition.name = @"Sofritas";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 145;
            item.nutrition.totalFat = 10;
            item.nutrition.saturatedFat = 2;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 555;
            item.nutrition.totalCarbs = 9;
            item.nutrition.dietaryFiber = 4;
            item.nutrition.sugar = 5;
            item.nutrition.protein = 8;
        } break;
        case CCIngredientItemTypeTomato:
        {
            item.oldIngredientName = @"Tomato Salsa";
            item.nutrition.name = @"Tomato Salsa";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Tomatillo-Red Salsa";
            item.nutrition.name = @"Tomatillo Red-Chili Salsa";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Tomatillo-Green Salsa";
            item.nutrition.name = @"Tomatillo Green-Chili Salsa";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 15;
            item.nutrition.totalFat = 0;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 255;
            item.nutrition.totalCarbs = 4;
            item.nutrition.dietaryFiber = 0;
            item.nutrition.sugar = 2;
            item.nutrition.protein = 0;
        } break;
        case CCIngredientItemTypeChili:
        {
            item.oldIngredientName = @"Roasted Chili Salsa";
            item.nutrition.name = @"Roasted Chili-Corn Salsa";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 80;
            item.nutrition.totalFat = 2;
            item.nutrition.saturatedFat = 0;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 300;
            item.nutrition.totalCarbs = 16;
            item.nutrition.dietaryFiber = 3;
            item.nutrition.sugar = 4;
            item.nutrition.protein = 3;
        } break;
        case CCIngredientItemTypeWRice:
        {
            item.oldIngredientName = @"White Rice";
            item.nutrition.name = @"White Rice";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 210;
            item.nutrition.totalFat = 4;
            item.nutrition.saturatedFat = 1;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 345;
            item.nutrition.totalCarbs = 40;
            item.nutrition.dietaryFiber = 1;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 4;
        } break;
        case CCIngredientItemTypeBRice:
        {
            item.oldIngredientName = @"Brown Rice";
            item.nutrition.name = @"Brown Rice";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 210;
            item.nutrition.totalFat = 6;
            item.nutrition.saturatedFat = 1;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 195;
            item.nutrition.totalCarbs = 36;
            item.nutrition.dietaryFiber = 3;
            item.nutrition.sugar = 0;
            item.nutrition.protein = 4;
        } break;
        case CCIngredientItemTypePBeans:
        {
            item.oldIngredientName = @"Pinto Beans";
            item.nutrition.name = @"Pinto Beans";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Black Beans";
            item.nutrition.name = @"Black Beans";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Fajitas";
            item.nutrition.name = @"Fajitas";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Cheese";
            item.nutrition.name = @"Cheese";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Corn";
            item.nutrition.name = @"Corn";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Guacamole";
            item.nutrition.name = @"Guacamole";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 230;
            item.nutrition.totalFat = 22;
            item.nutrition.saturatedFat = 4;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 0;
            item.nutrition.sodium = 375;
            item.nutrition.totalCarbs = 8;
            item.nutrition.dietaryFiber = 6;
            item.nutrition.sugar = 1;
            item.nutrition.protein = 2;
        } break;
        case CCIngredientItemTypeLettuce:
        {
            item.oldIngredientName = @"Lettuce";
            item.nutrition.name = @"Romaine Lettuce";
            item.ingredientName = item.nutrition.name;
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
            item.oldIngredientName = @"Sour Cream";
            item.nutrition.name = @"Sour Cream";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 115;
            item.nutrition.totalFat =  9;
            item.nutrition.saturatedFat = 7;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 38;
            item.nutrition.sodium = 30;
            item.nutrition.totalCarbs = 5;
            item.nutrition.dietaryFiber = 0;
            item.nutrition.sugar = 2;
            item.nutrition.protein = 2;
        } break;
        case CCIngredientItemTypeVinagrette:
        {
            item.oldIngredientName = @"vinagrette";
            item.nutrition.name = @"Vinagrette";
            item.ingredientName = item.nutrition.name;
            item.nutrition.calories = 270;
            item.nutrition.totalFat =  25;
            item.nutrition.saturatedFat = 5;
            item.nutrition.transFat = 0;
            item.nutrition.cholesterol = 10;
            item.nutrition.sodium = 850;
            item.nutrition.totalCarbs = 18;
            item.nutrition.dietaryFiber = 2;
            item.nutrition.sugar = 12;
            item.nutrition.protein = 1;
        } break;
    }
    
    return item;
}

@end
