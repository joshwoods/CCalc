//
//  Ingredients.h
//  CCalc
//
//  Created by Josh Woods on 11/1/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SavedMenuItems.h"

@class SavedMenuItems;

@interface Ingredients : SavedMenuItems

@property (nonatomic, retain) NSString * ingredientName;
@property (nonatomic, retain) SavedMenuItems *info;

@end
