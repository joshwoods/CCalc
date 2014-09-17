//
//  MainViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "MainViewController.h"
#import "UIImageEffects.h"
#import "CCMenuItem.h"
#import "CCIngredientItem.h"
#import "MeatViewController.h"

@interface MainViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) IBOutlet UIButton *mealButton;
@property (nonatomic, strong) IBOutlet UIButton *loadMealButton;
@property (nonatomic, strong) IBOutlet UIView *mainScreenContainerView;
@property (nonatomic, strong) IBOutlet UIView *mealSelectionView;

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
{
    BOOL _changeBackground;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    self.mealSelectionView.alpha = 0;
    [self setupNavBar];
    self.navBar.delegate = self;
    self.navBar.alpha = 0;
    self.image = [UIImage imageNamed:@"burrito"];
    [self updateImage:nil];
    UIGraphicsBeginImageContextWithOptions(self.image.size, NO, self.image.scale);
    [self.image drawAtPoint:CGPointZero];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuItem = [[CCMenuItem alloc] init];
    
    self.burrito = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBurrito];
    self.bowl = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBowl];
    self.hardTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeHardTaco];
    self.softTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSoftTaco];
}

- (void)updateImage:(id)sender
{
    UIImage *effectImage = nil;
    effectImage = [UIImageEffects imageByApplyingLightEffectToImage:self.image];
    self.imageView.image = effectImage;
}

#pragma mark - IBActions

- (IBAction)newMeal:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.mainScreenContainerView.alpha = 0;
    }];
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionTransitionNone animations:^{
        self.mealSelectionView.alpha = 1;
        self.navBar.alpha = 1;
    }completion:^(BOOL finished){
    }];
}

- (IBAction)refresh:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        [self.menuItem.items removeAllObjects];
        self.mealSelectionView.alpha = 0;
        self.navBar.alpha = 0;
    }];
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionTransitionNone animations:^{
        self.mainScreenContainerView.alpha = 1;
    }completion:^(BOOL finished){
    }];
}

- (IBAction)burritoPressed
{
    [self.menuItem addIngredientItem:self.burrito];
    [self performSegueWithIdentifier:@"mealTypeSelected" sender:self];
}

- (IBAction)bowlPressed
{
    
    [self.menuItem addIngredientItem:self.bowl];
    [self performSegueWithIdentifier:@"mealTypeSelected" sender:self];
}

- (IBAction)softPressed
{
    [self.menuItem addIngredientItem:self.softTaco];
    [self performSegueWithIdentifier:@"mealTypeSelected" sender:self];
}

- (IBAction)hardPressed
{
    [self.menuItem addIngredientItem:self.hardTaco];
    [self performSegueWithIdentifier:@"mealTypeSelected" sender:self];
}

#pragma mark - UINavigationBarDelegate

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

- (void)setupNavBar
{
    [self.navBar setBackgroundImage:[UIImage new]
                      forBarMetrics:UIBarMetricsDefault];
    self.navBar.shadowImage = [UIImage new];
    self.navBar.translucent = YES;
    self.navBar.backgroundColor = [UIColor clearColor];
}

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
