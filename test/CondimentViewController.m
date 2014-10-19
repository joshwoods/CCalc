//
//  CondimentViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "CondimentViewController.h"
#import "SummaryViewController.h"
#import "CCIngredientItem.h"

@interface CondimentViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) CCIngredientItem *cheese;
@property (nonatomic, strong) CCIngredientItem *lettuce;
@property (nonatomic, strong) CCIngredientItem *guac;
@property (nonatomic, strong) CCIngredientItem *corn;
@property (nonatomic, strong) CCIngredientItem *sourCream;


@property (nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@end

@implementation CondimentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
    [self blurBG];
    self.cheese = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCheese];
    self.corn = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCorn];
    self.guac = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeGuac];
    self.lettuce = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeLettuce];
    self.sourCream = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSourCream];
    // Do any additional setup after loading the view.
}

-(IBAction)cheesePressed
{
    [self.menuItem addIngredientItem:self.cheese];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)guacPressed
{
    [self.menuItem addIngredientItem:self.guac];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)cornPressed
{
    [self.menuItem addIngredientItem:self.corn];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)lettucePressed
{
    [self.menuItem addIngredientItem:self.lettuce];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)sourCreamPressed
{
    [self.menuItem addIngredientItem:self.sourCream];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)blurBG{
    self.image = [UIImage imageNamed:@"tacos"];
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.imageView.image = self.image;
    visualEffectView.frame = self.imageView.bounds;
    [self.imageView addSubview:visualEffectView];
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
