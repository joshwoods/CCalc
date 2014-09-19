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

@interface SalsaViewController ()

@property (nonatomic, strong) CCIngredientItem *tomato;
@property (nonatomic, strong) CCIngredientItem *tRed;
@property (nonatomic, strong) CCIngredientItem *tGreen;
@property (nonatomic, strong) CCIngredientItem *chili;

@property (nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SalsaViewController

-(IBAction)tomatoPressed
{
    
    [self.menuItem addIngredientItem:self.tomato];
    [self performSegueWithIdentifier:@"salsaItemSelected" sender:self];
}

-(IBAction)tRedPressed
{
    [self.menuItem addIngredientItem:self.tRed];
    [self performSegueWithIdentifier:@"salsaItemSelected" sender:self];
}

-(IBAction)tGreenPressed
{
    [self.menuItem addIngredientItem:self.tGreen];
    [self performSegueWithIdentifier:@"salsaItemSelected" sender:self];
}

-(IBAction)chiliPressed
{
    [self.menuItem addIngredientItem:self.chili];
    [self performSegueWithIdentifier:@"salsaItemSelected" sender:self];
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
