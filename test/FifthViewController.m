//
//  FifthViewController.m
//  CCalc
//
//  Created by Josh Woods on 3/14/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "FifthViewController.h"
#import "SummaryViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController
{
    int cheeseServing;
    int cornServing;
    int guacServing;
    int lettuceServing;
    int sourCreamServing;
}

-(IBAction)cheesePressed
{
    if([self.cheeseAddButton isTouchInside])
    {
        self.cheeseBGLabel.backgroundColor = [UIColor colorWithRed:0.357 green:0.702 blue:0.569 alpha:1];
        cheeseServing++;
        [self.menuItem addIngredientItem:self.cheese];
        NSLog(@"%i", cheeseServing);
        if(cheeseServing >= 1){
            self.cheeseSubtractButton.hidden = NO;
        }
        self.cheeseSS.text = [NSString stringWithFormat:@"%i", cheeseServing];
        NSLog(@"%ld", (long)self.cheese.nutrition.cal);
    } else if ([self.cheeseSubtractButton isTouchInside]){
        cheeseServing--;
        [self.menuItem removeIngredientItem:self.cheese];
        self.cheeseSS.text = [NSString stringWithFormat:@"%i", cheeseServing];
        if(cheeseServing < 1)
        {
            self.cheeseBGLabel.backgroundColor = [UIColor colorWithRed:0.604 green:0.733 blue:0.525 alpha:1];
            self.cheeseSubtractButton.hidden = YES;
        }
    }
}

-(IBAction)guacPressed
{
    if([self.guacAddButton isTouchInside])
    {
        self.guacBGLabel.backgroundColor = [UIColor colorWithRed:0.357 green:0.702 blue:0.569 alpha:1];
        guacServing++;
        [self.menuItem addIngredientItem:self.guac];
        NSLog(@"%i", guacServing);
        if(guacServing >= 1){
            self.guacSubtractButton.hidden = NO;
        }
        self.guacSS.text = [NSString stringWithFormat:@"%i", guacServing];
        NSLog(@"%ld", (long)self.guac.nutrition.cal);
    } else if ([self.guacSubtractButton isTouchInside]){
        guacServing--;
        [self.menuItem removeIngredientItem:self.guac];
        self.guacSS.text = [NSString stringWithFormat:@"%i", guacServing];
        if(guacServing < 1)
        {
            self.guacBGLabel.backgroundColor = [UIColor colorWithRed:0.604 green:0.733 blue:0.525 alpha:1];
            self.guacSubtractButton.hidden = YES;
        }
    }
}

-(IBAction)cornPressed
{
    if([self.cornAddButton isTouchInside])
    {
        self.cornBGLabel.backgroundColor = [UIColor colorWithRed:0.357 green:0.702 blue:0.569 alpha:1];
        cornServing++;
        [self.menuItem addIngredientItem:self.corn];
        NSLog(@"%i", cornServing);
        if(cornServing >= 1){
            self.cornSubtractButton.hidden = NO;
        }
        self.cornSS.text = [NSString stringWithFormat:@"%i", cornServing];
        NSLog(@"%ld", (long)self.corn.nutrition.cal);
    } else if ([self.cornSubtractButton isTouchInside]){
        cornServing--;
        [self.menuItem removeIngredientItem:self.corn];
        self.cornSS.text = [NSString stringWithFormat:@"%i", cornServing];
        if(cornServing < 1)
        {
            self.cornBGLabel.backgroundColor = [UIColor colorWithRed:0.604 green:0.733 blue:0.525 alpha:1];
            self.cornSubtractButton.hidden = YES;
        }
    }
}

-(IBAction)lettucePressed
{
    if([self.lettuceAddButton isTouchInside])
    {
        self.lettuceBGLabel.backgroundColor = [UIColor colorWithRed:0.357 green:0.702 blue:0.569 alpha:1];
        lettuceServing++;
        [self.menuItem addIngredientItem:self.lettuce];
        NSLog(@"%i", lettuceServing);
        if(lettuceServing >= 1){
            self.lettuceSubtractButton.hidden = NO;
        }
        self.lettuceSS.text = [NSString stringWithFormat:@"%i", lettuceServing];
        NSLog(@"%ld", (long)self.lettuce.nutrition.cal);
    } else if ([self.lettuceSubtractButton isTouchInside]){
        lettuceServing--;
        [self.menuItem removeIngredientItem:self.lettuce];
        self.lettuceSS.text = [NSString stringWithFormat:@"%i", lettuceServing];
        if(lettuceServing < 1)
        {
            self.lettuceBGLabel.backgroundColor = [UIColor colorWithRed:0.604 green:0.733 blue:0.525 alpha:1];
            self.lettuceSubtractButton.hidden = YES;
        }
    }
}

-(IBAction)sourCreamPressed
{
    if([self.sourCreamAddButton isTouchInside])
    {
        self.sourCreamBGLabel.backgroundColor = [UIColor colorWithRed:0.357 green:0.702 blue:0.569 alpha:1];
        sourCreamServing++;
        [self.menuItem addIngredientItem:self.sourCream];
        NSLog(@"%i", sourCreamServing);
        if(sourCreamServing >= 1){
            self.sourCreamSubtractButton.hidden = NO;
        }
        self.sourCreamSS.text = [NSString stringWithFormat:@"%i", sourCreamServing];
        NSLog(@"%ld", (long)self.sourCream.nutrition.cal);
    } else if ([self.sourCreamSubtractButton isTouchInside]){
        sourCreamServing--;
        [self.menuItem removeIngredientItem:self.sourCream];
        self.sourCreamSS.text = [NSString stringWithFormat:@"%i", sourCreamServing];
        if(sourCreamServing < 1)
        {
            self.sourCreamBGLabel.backgroundColor = [UIColor colorWithRed:0.604 green:0.733 blue:0.525 alpha:1];
            self.sourCreamSubtractButton.hidden = YES;
        }
    }
}

-(IBAction)goBack
{
    [[self navigationController] popViewControllerAnimated:YES];
}

-(IBAction)startOverButtonPressed
{
    [self.menuItem.items removeAllObjects];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.aboutMenuItem = [[CCMenuItem alloc] init];
    
    self.cheese = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCheese];
    self.corn = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCorn];
    self.guac = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeGuac];
    self.lettuce = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeLettuce];
    self.sourCream = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSourCream];
    
    self.cheeseInfoButton.tag = CCIngredientItemTypeCheese;
    self.cornInfoButton.tag = CCIngredientItemTypeCorn;
    self.guacInfoButton.tag = CCIngredientItemTypeGuac;
    self.lettuceInfoButton.tag = CCIngredientItemTypeLettuce;
    self.sourCreamInfoButton.tag = CCIngredientItemTypeSourCream;
    
    self.cheeseSubtractButton.hidden = YES;
    self.cornSubtractButton.hidden = YES;
    self.guacSubtractButton.hidden = YES;
    self.lettuceSubtractButton.hidden = YES;
    self.sourCreamSubtractButton.hidden = YES;
    
    NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
	SummaryViewController *transferViewController = segue.destinationViewController;
    	
	NSLog(@"prepareForSegue: %@", segue.identifier);
    
	if([segue.identifier isEqualToString:@"finalSegue"])
	{
		transferViewController.menuItem = self.menuItem;
		NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
	}
}
@end
