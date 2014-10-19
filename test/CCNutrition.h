//
//  CCNutrition.h
//  CCalc
//
//  Created by Josh Woods on 3/1/14.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCNutrition : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger calories;
@property (nonatomic, assign) NSInteger totalFat;
@property (nonatomic, assign) NSInteger saturatedFat;
@property (nonatomic, assign) NSInteger transFat;
@property (nonatomic, assign) NSInteger cholesterol;
@property (nonatomic, assign) NSInteger sodium;
@property (nonatomic, assign) NSInteger totalCarbs;
@property (nonatomic, assign) NSInteger dietaryFiber;
@property (nonatomic, assign) NSInteger sugar;
@property (nonatomic, assign) NSInteger protein;

@end
