//
//  TableViewCell.h
//  CCalc
//
//  Created by Josh Woods on 10/18/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *caloriesLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalFatLabel;
@property (nonatomic, weak) IBOutlet UILabel *saturatedFatLabel;
@property (nonatomic, weak) IBOutlet UILabel *transFatLabel;
@property (nonatomic, weak) IBOutlet UILabel *cholesterolLabel;
@property (nonatomic, weak) IBOutlet UILabel *sodiumLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalCarbsLabel;
@property (nonatomic, weak) IBOutlet UILabel *dietaryFiberLabel;
@property (nonatomic, weak) IBOutlet UILabel *sugarLabel;
@property (nonatomic, weak) IBOutlet UILabel *proteinLabel;

@end
