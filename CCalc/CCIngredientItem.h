//
//  CCIngredientItem.h
//  CCalc
//
//  Created by Josh Woods on 3/1/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCNutrition.h"

typedef NS_ENUM(NSInteger, CCIngredientItemType)
{
    CCIngredientItemTypeBurrito = 0,
    CCIngredientItemTypeSalad,
    CCIngredientItemTypeBowl,
    CCIngredientItemTypeHardTaco,
    CCIngredientItemTypeSoftTaco,
    CCIngredientItemTypeSoftFlourTaco,
    CCIngredientItemTypeSteak,
    CCIngredientItemTypeChicken,
    CCIngredientItemTypeCarnitas,
    CCIngredientItemTypeBarbacoa,
    CCIngredientItemTypeSofritas,
    CCIngredientItemTypeTomato,
    CCIngredientItemTypeTRed,
    CCIngredientItemTypeTGreen,
    CCIngredientItemTypeChili,
    CCIngredientItemTypeWRice,
    CCIngredientItemTypeBRice,
    CCIngredientItemTypePBeans,
    CCIngredientItemTypeBBeans,
    CCIngredientItemTypeFajitas,
    CCIngredientItemTypeCheese,
    CCIngredientItemTypeCorn,
    CCIngredientItemTypeGuac,
    CCIngredientItemTypeLettuce,
    CCIngredientItemTypeSourCream,
    CCIngredientItemTypeVinagrette,
    CCIngredientItemTypeChips,
    CCIngredientItemTypeChipsGuac,
    CCIngredientItemTypeChipsTomato,
    CCIngredientItemTypeChipsChiliCorn,
    CCIngredientItemTypeChipsRedChili,
    CCIngredientItemTypeChipsGreenChili,
    CCIngredientItemTypePatronMarg,
    CCIngredientItemTypeSauzaMarg,
};

typedef NS_ENUM(NSInteger, CCIngredientKidsItemType)
{
    CCIngredientKidsItemTypeSalad = 0,
};


@interface CCIngredientItem : NSObject

+(instancetype)ingredientItemWithType:(CCIngredientItemType)type;
+(instancetype)ingredientItemWithKidsType:(CCIngredientKidsItemType)type;

@property (nonatomic, strong) CCNutrition *nutrition;
@property (nonatomic, copy) NSString *ingredientName;
@property (nonatomic, copy) NSString *oldIngredientName;
@property (nonatomic, assign) NSInteger servingSize;

@end
