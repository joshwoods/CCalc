//
//  SavedMenuItems.h
//  CCalc
//
//  Created by Josh Woods on 10/29/14.
//  Copyright (c) 2014 joshwoods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SavedMenuItems : NSManagedObject

@property (nonatomic, retain) NSString * menuName;
@property (nonatomic, retain) NSString * calories;
@property (nonatomic, retain) NSString * totalFat;
@property (nonatomic, retain) NSString * saturatedFat;
@property (nonatomic, retain) NSString * transFat;
@property (nonatomic, retain) NSString * cholesterol;
@property (nonatomic, retain) NSString * sodium;
@property (nonatomic, retain) NSString * totalCarbs;
@property (nonatomic, retain) NSString * dietaryFiber;
@property (nonatomic, retain) NSString * sugar;
@property (nonatomic, retain) NSString * protein;

@end
