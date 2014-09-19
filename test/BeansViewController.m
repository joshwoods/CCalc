//
//  BeansViewController.m
//  CCalc
//
//  Created by Josh Woods on 9/16/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "BeansViewController.h"
#import "SalsaViewController.h"
#import "CCIngredientItem.h"

@interface BeansViewController ()

@property (nonatomic, strong) CCIngredientItem *fajitas;
@property (nonatomic, strong) CCIngredientItem *wRice;
@property (nonatomic, strong) CCIngredientItem *bRice;
@property (nonatomic, strong) CCIngredientItem *pBeans;
@property (nonatomic, strong) CCIngredientItem *bBeans;


@property (nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BeansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self blurBG];
    self.fajitas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeFajitas];
    self.wRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeWRice];
    self.bRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBRice];
    self.pBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypePBeans];
    self.bBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBBeans];
    // Do any additional setup after loading the view.
}

- (void)blurBG{
    self.image = [UIImage imageNamed:@"fajitas"];
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.imageView.image = self.image;
    visualEffectView.frame = self.imageView.bounds;
    [self.imageView addSubview:visualEffectView];
}

-(IBAction)fajitasPressed
{
    [self.menuItem addIngredientItem:self.fajitas];
    [self performSegueWithIdentifier:@"beanItemSelected" sender:self];
}

-(IBAction)wRicePressed
{
    [self.menuItem addIngredientItem:self.wRice];
    [self performSegueWithIdentifier:@"beanItemSelected" sender:self];
}

-(IBAction)bRicePressed
{
    [self.menuItem addIngredientItem:self.bRice];
    [self performSegueWithIdentifier:@"beanItemSelected" sender:self];
}

-(IBAction)pBeansPressed
{
    [self.menuItem addIngredientItem:self.pBeans];
    [self performSegueWithIdentifier:@"beanItemSelected" sender:self];
}

-(IBAction)bBeansPressed
{
    [self.menuItem addIngredientItem:self.bBeans];
    [self performSegueWithIdentifier:@"beanItemSelected" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    if([segue.identifier isEqualToString:@"beanItemSelected"])
    {
        SalsaViewController *transferViewController = segue.destinationViewController;
        transferViewController.menuItem = self.menuItem;
        NSLog(@"%lu", (unsigned long)[self.menuItem.items count]);
    }
}

@end
