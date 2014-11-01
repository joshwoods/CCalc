//
//  InitialViewController.h
//  CCalc
//
//  Created by Josh Woods on 10/18/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;

@interface InitialViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *savedItems;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
