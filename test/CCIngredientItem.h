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
    CCIngredientItemTypeBowl,
    CCIngredientItemTypeHardTaco,
    CCIngredientItemTypeSoftTaco,
    CCIngredientItemTypeSteak,
    CCIngredientItemTypeChicken,
    CCIngredientItemTypeCarnitas,
    CCIngredientItemTypeBarbacoa,
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
    CCIngredientItemTypeSourCream
};

@interface CCIngredientItem : NSObject

+(instancetype)ingredientItemWithType:(CCIngredientItemType)type;

@property (nonatomic, strong) CCNutrition *nutrition;
@property (nonatomic, copy) NSString *ingredientName;
@property (nonatomic, assign) NSInteger servingSize;

@end
