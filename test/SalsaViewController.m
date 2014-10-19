//
//  SalsaViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "SalsaViewController.h"
#import "CCIngredientItem.h"
#import "CondimentViewController.h"

@interface SalsaViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) CCIngredientItem *tomato;
@property (nonatomic, strong) CCIngredientItem *tRed;
@property (nonatomic, strong) CCIngredientItem *tGreen;
@property (nonatomic, strong) CCIngredientItem *chili;

@property (nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@end

@implementation SalsaViewController

-(IBAction)tomatoPressed
{
    
    [self.menuItem addIngredientItem:self.tomato];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)tRedPressed
{
    [self.menuItem addIngredientItem:self.tRed];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)tGreenPressed
{
    [self.menuItem addIngredientItem:self.tGreen];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

-(IBAction)chiliPressed
{
    [self.menuItem addIngredientItem:self.chili];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)blurBG{
    self.image = [UIImage imageNamed:@"salsa"];
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.imageView.image = self.image;
    visualEffectView.frame = self.imageView.bounds;
    [self.imageView addSubview:visualEffectView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
    [self blurBG];
    self.tomato = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTomato];
    self.tRed = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTRed];
    self.tGreen = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTGreen];
    self.chili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChili];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"salsaItemSelected"])
    {
        CondimentViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
        NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
    }
}

@end
