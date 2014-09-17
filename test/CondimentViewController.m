//
//  CondimentViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "CondimentViewController.h"
#import "SummaryViewController.h"
#import "UIImageEffects.h"
#import "CCIngredientItem.h"

@interface CondimentViewController ()

@property (nonatomic, strong) CCIngredientItem *cheese;
@property (nonatomic, strong) CCIngredientItem *lettuce;
@property (nonatomic, strong) CCIngredientItem *guac;
@property (nonatomic, strong) CCIngredientItem *corn;
@property (nonatomic, strong) CCIngredientItem *sourCream;


@property (nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation CondimentViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.image = [UIImage imageNamed:@"tacos"];
    [self updateImage:nil];
    UIGraphicsBeginImageContextWithOptions(self.image.size, NO, self.image.scale);
    [self.image drawAtPoint:CGPointZero];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cheese = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCheese];
    self.corn = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCorn];
    self.guac = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeGuac];
    self.lettuce = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeLettuce];
    self.sourCream = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSourCream];
    // Do any additional setup after loading the view.
}

- (void)updateImage:(id)sender
{
    UIImage *effectImage = nil;
    effectImage = [UIImageEffects imageByApplyingLightEffectToImage:self.image];
    self.imageView.image = effectImage;
}

-(IBAction)cheesePressed
{
    [self.menuItem addIngredientItem:self.cheese];
    [self performSegueWithIdentifier:@"condimentItemSelected" sender:self];
}

-(IBAction)guacPressed
{
    [self.menuItem addIngredientItem:self.guac];
    [self performSegueWithIdentifier:@"condimentItemSelected" sender:self];
}

-(IBAction)cornPressed
{
    [self.menuItem addIngredientItem:self.corn];
    [self performSegueWithIdentifier:@"condimentItemSelected" sender:self];
}

-(IBAction)lettucePressed
{
    [self.menuItem addIngredientItem:self.lettuce];
    [self performSegueWithIdentifier:@"condimentItemSelected" sender:self];
}

-(IBAction)sourCreamPressed
{
    [self.menuItem addIngredientItem:self.sourCream];
    [self performSegueWithIdentifier:@"condimentItemSelected" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"condimentItemSelected"])
    {
        SummaryViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
        NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
    }
}

@end
