//
//  MeatViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "MeatViewController.h"
#import "BeansViewController.h"
#import "CCIngredientItem.h"
#import "UIImageEffects.h"

@interface MeatViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) IBOutlet UINavigationBar *navbar;
@property (nonatomic, strong) CCIngredientItem *steak;
@property (nonatomic, strong) CCIngredientItem *chicken;
@property (nonatomic, strong) CCIngredientItem *carnitas;
@property (nonatomic, strong) CCIngredientItem *barbacoa;

@property (nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation MeatViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.image = [UIImage imageNamed:@"nachos"];
    [self updateImage:nil];
    UIGraphicsBeginImageContextWithOptions(self.image.size, NO, self.image.scale);
    [self.image drawAtPoint:CGPointZero];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navbar.delegate = self;
    self.steak= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSteak];
    self.chicken= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChicken];
    self.barbacoa= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBarbacoa];
    self.carnitas= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCarnitas];
    // Do any additional setup after loading the view.
}

- (void)updateImage:(id)sender
{
    UIImage *effectImage = nil;
    effectImage = [UIImageEffects imageByApplyingLightEffectToImage:self.image];
    self.imageView.image = effectImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)steakPressed
{
    [self.menuItem addIngredientItem:self.steak];
    [self performSegueWithIdentifier:@"meatItemSelected" sender:self];
}

-(IBAction)chickenPressed
{
    
    [self.menuItem addIngredientItem:self.chicken];
    [self performSegueWithIdentifier:@"meatItemSelected" sender:self];
}

-(IBAction)barbacoaPressed
{
    [self.menuItem addIngredientItem:self.barbacoa];
    [self performSegueWithIdentifier:@"meatItemSelected" sender:self];
}

-(IBAction)carnitasPressed
{
    [self.menuItem addIngredientItem:self.carnitas];
    [self performSegueWithIdentifier:@"meatItemSelected" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"meatItemSelected"])
    {
        BeansViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
        NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
    }
}

#pragma mark - UINavigationBarDelegate

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

@end
