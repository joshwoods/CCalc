//
//  SavedMenuItems.h
//  CCalc
//
//  Created by Josh Woods on 11/1/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ingredients;

@interface SavedMenuItems : NSManagedObject

@property (nonatomic, retain) NSString * calories;
@property (nonatomic, retain) NSString * cholesterol;
@property (nonatomic, retain) NSString * dietaryFiber;
@property (nonatomic, retain) NSString * menuName;
@property (nonatomic, retain) NSString * protein;
@property (nonatomic, retain) NSString * saturatedFat;
@property (nonatomic, retain) NSString * sodium;
@property (nonatomic, retain) NSString * sugar;
@property (nonatomic, retain) NSString * totalCarbs;
@property (nonatomic, retain) NSString * totalFat;
@property (nonatomic, retain) NSString * transFat;
@property (nonatomic, retain) NSMutableSet *details;
@end

@interface SavedMenuItems (CoreDataGeneratedAccessors)

- (void)addDetailsObject:(Ingredients *)value;
- (void)removeDetailsObject:(Ingredients *)value;
- (void)addDetails:(NSSet *)values;
- (void)removeDetails:(NSSet *)values;

@end
