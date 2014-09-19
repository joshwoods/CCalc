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

@interface MeatViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) CCIngredientItem *steak;
@property (nonatomic, strong) CCIngredientItem *chicken;
@property (nonatomic, strong) CCIngredientItem *carnitas;
@property (nonatomic, strong) CCIngredientItem *barbacoa;

@property (nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@end

@implementation MeatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.delegate = self;
    
    [self setupNavBar];
    [self blurBG];
    
    self.steak= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSteak];
    self.chicken= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChicken];
    self.barbacoa= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBarbacoa];
    self.carnitas= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCarnitas];
    // Do any additional setup after loading the view.
}

- (void)blurBG{
    self.image = [UIImage imageNamed:@"nachos"];
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

- (IBAction)goBack:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.menuItem.items removeLastObject];
    NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
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

- (void)setupNavBar
{
    [self.navBar setBackgroundImage:[UIImage new]
                      forBarMetrics:UIBarMetricsDefault];
    self.navBar.shadowImage = [UIImage new];
    self.navBar.translucent = YES;
    self.navBar.backgroundColor = [UIColor clearColor];
}

#pragma mark - UINavigationBarDelegate

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
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

@end
