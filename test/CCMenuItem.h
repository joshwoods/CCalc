//
//  CCMenuItem.h
//  CCalc
//
//  Created by Josh Woods on 3/1/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCIngredientItem.h"

@interface CCMenuItem : NSObject

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *aboutItem;
@property (readonly) CCNutrition *nutritionTotal;
@property (readonly) CCNutrition *aboutNutrition;

-(void)addIngredientItem:(CCIngredientItem *)ingredient;
-(void)removeIngredientItem:(CCIngredientItem *)ingredient;
-(void)addAboutItem:(CCIngredientItem *)ingredient;
-(void)removeAboutItem:(CCIngredientItem *)ingredient;
-(void)startOver;

@end
