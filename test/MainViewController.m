//
//  MainViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "MainViewController.h"
#import "CCMenuItem.h"
#import "CCIngredientItem.h"
#import "MeatViewController.h"

@interface MainViewController () <UINavigationBarDelegate>

@property (nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@property (nonatomic, strong) CCMenuItem *menuItem;
@property (nonatomic, strong) CCIngredientItem *burrito;
@property (nonatomic, strong) CCIngredientItem *bowl;
@property (nonatomic, strong) CCIngredientItem *softTaco;
@property (nonatomic, strong) CCIngredientItem *hardTaco;

@end

@implementation MainViewController

- (void)viewDidLoad {
    self.navBar.delegate = self;
    
    [super viewDidLoad];
    [self blurBG];
    
    self.menuItem = [[CCMenuItem alloc] init];
    self.burrito = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBurrito];
    self.bowl = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBowl];
    self.hardTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeHardTaco];
    self.softTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSoftTaco];
}

- (void)blurBG{
    self.image = [UIImage imageNamed:@"fajitas"];
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.imageView.image = self.image;
    visualEffectView.frame = self.imageView.bounds;
    [self.imageView addSubview:visualEffectView];
}

#pragma mark - IBActions

- (IBAction)refresh:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        [self.menuItem.items removeAllObjects];
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (IBAction)burritoPressed
{
    [self.menuItem addIngredientItem:self.burrito];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)bowlPressed
{
    [self.menuItem addIngredientItem:self.bowl];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)softPressed
{
    [self.menuItem addIngredientItem:self.softTaco];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)hardPressed
{
    [self.menuItem addIngredientItem:self.hardTaco];
    self.navBar.topItem.title = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//#pragma mark - UINavigationBarDelegate
//
//- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
//{
//    return UIBarPositionTopAttached;
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"mealTypeSelected"])
        {
        MeatViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
        NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
        }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
