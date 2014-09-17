//
//  CCIngredientItem.m
//  CCalc
//
//  Created by Josh Woods on 3/1/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "CCIngredientItem.h"

@implementation CCIngredientItem

NSString *CCIngredientItemNameFromType(CCIngredientItemType type)
{
    switch (type)
    {
        case CCIngredientItemTypeBurrito: return @"Burrito";
        case CCIngredientItemTypeBowl: return @"Bowl";
        case CCIngredientItemTypeHardTaco: return @"Hard Taco";
        case CCIngredientItemTypeSoftTaco: return @"Soft Taco";
        case CCIngredientItemTypeSteak:  return @"Steak";
        case CCIngredientItemTypeChicken:  return @"Chicken";
        case CCIngredientItemTypeCarnitas:  return @"Carnitas";
        case CCIngredientItemTypeBarbacoa:  return @"Barbacoa";
        case CCIngredientItemTypeTomato:  return @"Tomato Salsa";
        case CCIngredientItemTypeTRed:  return @"Tomatillo-Red Salsa";
        case CCIngredientItemTypeTGreen:  return @"Tomatillo-Green Salsa";
        case CCIngredientItemTypeChili:  return @"Roasted Chili Salsa";
        case CCIngredientItemTypeWRice:  return @"White Rice";
        case CCIngredientItemTypeBRice:  return @"Brown Rice";
        case CCIngredientItemTypePBeans:  return @"Pinto Beans";
        case CCIngredientItemTypeBBeans:  return @"Black Beans";
        case CCIngredientItemTypeFajitas:  return @"Fajitas";
        case CCIngredientItemTypeCheese:  return @"Cheese";
        case CCIngredientItemTypeCorn:  return @"Corn";
        case CCIngredientItemTypeGuac:  return @"Guacamole";
        case CCIngredientItemTypeLettuce:  return @"Lettuce";
        case CCIngredientItemTypeSourCream:  return @"Sour Cream";
    }
}

+(id)new
{
    CCIngredientItem *ingredient = [[CCIngredientItem alloc] init];
    ingredient.nutrition = [[CCNutrition alloc] init];
    return ingredient;
}

+(instancetype)ingredientItemWithType:(CCIngredientItemType)type
{
    CCIngredientItem *item = [CCIngredientItem new];
    item.ingredientName = CCIngredientItemNameFromType(type);
    switch (type) {
        case CCIngredientItemTypeBurrito:
        {
            item.nutrition.cal = 300;
            item.nutrition.tFat = 10;
            item.nutrition.sf = 1;
            item.nutrition.transf = 0;
            item.nutrition.cho =0;
            item.nutrition.sod = 690;
            item.nutrition.tc = 6;
            item.nutrition.df = 3;
            item.nutrition.sug = 0;
            item.nutrition.pro = 7;
        } break;
        case CCIngredientItemTypeBowl:
        {
            item.nutrition.cal = 0;
            item.nutrition.tFat = 0;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 0;
            item.nutrition.tc = 0;
            item.nutrition.df = 0;
            item.nutrition.sug = 0;
            item.nutrition.pro = 0;
        } break;
        case CCIngredientItemTypeHardTaco:
        {
            item.nutrition.cal = 210;
            item.nutrition.tFat = 8;
            item.nutrition.sf = 3;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 30;
            item.nutrition.tc = 30;
            item.nutrition.df = 6;
            item.nutrition.sug = 3;
            item.nutrition.pro = 3;
        } break;
        case CCIngredientItemTypeSoftTaco:
        {
            item.nutrition.cal = 210;
            item.nutrition.tFat = 0;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 30;
            item.nutrition.tc = 45;
            item.nutrition.df = 6;
            item.nutrition.sug = 0;
            item.nutrition.pro = 3;
        } break;
        case CCIngredientItemTypeSteak:
        {
            item.nutrition.cal = 190;
            item.nutrition.tFat = 7;
            item.nutrition.sf = 2;
            item.nutrition.transf = 0;
            item.nutrition.cho = 65;
            item.nutrition.sod = 320;
            item.nutrition.tc = 2;
            item.nutrition.df = 0;
            item.nutrition.sug = 1;
            item.nutrition.pro = 30;
        } break;
        case CCIngredientItemTypeChicken:
        {
            item.nutrition.cal = 180;
            item.nutrition.tFat = 7;
            item.nutrition.sf = 3;
            item.nutrition.transf = 0;
            item.nutrition.cho = 125;
            item.nutrition.sod = 310;
            item.nutrition.tc = 0;
            item.nutrition.df = 1;
            item.nutrition.sug = 0;
            item.nutrition.pro = 32;
        } break;
        case CCIngredientItemTypeCarnitas:
        {
            item.nutrition.cal = 220;
            item.nutrition.tFat = 13;
            item.nutrition.sf = 6;
            item.nutrition.transf = 0;
            item.nutrition.cho = 65;
            item.nutrition.sod = 500;
            item.nutrition.tc = 1;
            item.nutrition.df = 0;
            item.nutrition.sug = 0;
            item.nutrition.pro = 26;
        } break;
        case CCIngredientItemTypeBarbacoa:
        {
            item.nutrition.cal = 165;
            item.nutrition.tFat = 7;
            item.nutrition.sf = 3;
            item.nutrition.transf = 0;
            item.nutrition.cho = 65;
            item.nutrition.sod = 530;
            item.nutrition.tc = 2;
            item.nutrition.df = 1;
            item.nutrition.sug = 0;
            item.nutrition.pro = 24;
        } break;
        case CCIngredientItemTypeTomato:
        {
            item.nutrition.cal = 20;
            item.nutrition.tFat = 0;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 500;
            item.nutrition.tc = 4;
            item.nutrition.df = 1;
            item.nutrition.sug = 3;
            item.nutrition.pro = 1;
        } break;
        case CCIngredientItemTypeTRed:
        {
            item.nutrition.cal = 25;
            item.nutrition.tFat = 1;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 500;
            item.nutrition.tc = 4;
            item.nutrition.df = 2;
            item.nutrition.sug = 1;
            item.nutrition.pro = 1;
        } break;
        case CCIngredientItemTypeTGreen:
        {
            item.nutrition.cal = 20;
            item.nutrition.tFat = 0;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 250;
            item.nutrition.tc = 4;
            item.nutrition.df = 1;
            item.nutrition.sug = 2;
            item.nutrition.pro = 1;
        } break;
        case CCIngredientItemTypeChili:
        {
            item.nutrition.cal = 80;
            item.nutrition.tFat = 2;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 330;
            item.nutrition.tc = 16;
            item.nutrition.df = 3;
            item.nutrition.sug = 4;
            item.nutrition.pro = 3;
        } break;
        case CCIngredientItemTypeWRice:
        {
            item.nutrition.cal = 185;
            item.nutrition.tFat = 4;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 375;
            item.nutrition.tc = 34;
            item.nutrition.df = 1;
            item.nutrition.sug = 0;
            item.nutrition.pro = 4;
        } break;
        case CCIngredientItemTypeBRice:
        {
            item.nutrition.cal = 200;
            item.nutrition.tFat = 7;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 165;
            item.nutrition.tc = 32;
            item.nutrition.df = 3;
            item.nutrition.sug = 1;
            item.nutrition.pro = 4;
        } break;
        case CCIngredientItemTypePBeans:
        {
            item.nutrition.cal = 115;
            item.nutrition.tFat = 1;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 300;
            item.nutrition.tc = 21;
            item.nutrition.df = 10;
            item.nutrition.sug = 1;
            item.nutrition.pro = 6;
        } break;
        case CCIngredientItemTypeBBeans:
        {
            item.nutrition.cal = 120;
            item.nutrition.tFat = 1;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 260;
            item.nutrition.tc = 22;
            item.nutrition.df = 12;
            item.nutrition.sug = 1;
            item.nutrition.pro = 7;
        } break;
        case CCIngredientItemTypeFajitas:
        {
            item.nutrition.cal = 20;
            item.nutrition.tFat = 1;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 170;
            item.nutrition.tc = 4;
            item.nutrition.df = 1;
            item.nutrition.sug = 2;
            item.nutrition.pro = 1;
        } break;
        case CCIngredientItemTypeCheese:
        {
            item.nutrition.cal = 100;
            item.nutrition.tFat = 8;
            item.nutrition.sf = 5;
            item.nutrition.transf = 0;
            item.nutrition.cho = 30;
            item.nutrition.sod = 190;
            item.nutrition.tc = 1;
            item.nutrition.df = 0;
            item.nutrition.sug = 0;
            item.nutrition.pro = 6;
        } break;
        case CCIngredientItemTypeCorn:
        {
            item.nutrition.cal = 330;
            item.nutrition.tFat = 4;
            item.nutrition.sf = 1;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0 ;
            item.nutrition.sod = 29;
            item.nutrition.tc = 62;
            item.nutrition.df = 0;
            item.nutrition.sug = 0;
            item.nutrition.pro = 8;
        } break;
        case CCIngredientItemTypeGuac:
        {
            item.nutrition.cal = 170;
            item.nutrition.tFat = 16;
            item.nutrition.sf = 3;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 410;
            item.nutrition.tc = 8;
            item.nutrition.df = 18;
            item.nutrition.sug = 0;
            item.nutrition.pro = 2;
        } break;
        case CCIngredientItemTypeLettuce:
        {
            item.nutrition.cal = 5;
            item.nutrition.tFat = 0;
            item.nutrition.sf = 0;
            item.nutrition.transf = 0;
            item.nutrition.cho = 0;
            item.nutrition.sod = 0;
            item.nutrition.tc = 1;
            item.nutrition.df = 1;
            item.nutrition.sug = 0;
            item.nutrition.pro = 0;
        } break;
            
        case CCIngredientItemTypeSourCream:
        {
            item.nutrition.cal = 115;
            item.nutrition.tFat =  10;
            item.nutrition.sf = 7;
            item.nutrition.transf = 0;
            item.nutrition.cho = 40;
            item.nutrition.sod = 30;
            item.nutrition.tc = 1;
            item.nutrition.df = 0;
            item.nutrition.sug = 2;
            item.nutrition.pro = 2;
        } break;
            
    }
    
    return item;
}

@end
