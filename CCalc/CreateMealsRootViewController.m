//
//  CreateMealsRootViewController.m
//  CCalc
//
//  Created by Josh Woods on 5/3/15.
//  Copyright (c) 2015 joshwoods. All rights reserved.
//

#import "CreateMealsRootViewController.h"
#import "UIViewController+RRAdditions.h"
#import "UIColor+FlatUI.h"
#import "SummaryViewController.h"

@interface CreateMealsRootViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (nonatomic, strong) MealViewController *mealViewController;
@property (nonatomic, strong) MeatViewController *meatViewController;
@property (nonatomic, strong) BeansViewController *beansViewController;
@property (nonatomic, strong) SalsaViewController *salsaViewController;
@property (nonatomic, strong) CondimentViewController *condimentViewController;

@property (nonatomic, weak) IBOutlet UIButton *summaryButton;

//Toggle Indexes
@property (nonatomic, assign) NSInteger previousIndex;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation CreateMealsRootViewController

#pragma mark - Toggle Controllers
- (IBAction)toggleSegment:(id)sender {
    [self toggleControllers];
}

- (void)toggleControllers {
    _currentIndex = _segmentControl.selectedSegmentIndex;
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    if (_previousIndex == 0 && _currentIndex == 1) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = 0.0;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 0 && _currentIndex == 2) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = 0.0;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 0 && _currentIndex == 3) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = 0.0;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 0 && _currentIndex == 4) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        _leadingMiscConstraint.constant = 0.0;
    } else if (_previousIndex == 1 && _currentIndex == 0) {
        _leadingMealConstraint.constant = 0.0;
        _leadingMeatConstraint.constant = self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 1 && _currentIndex == 2) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = 0.0;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 1 && _currentIndex == 3) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = 0.0;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 1 && _currentIndex == 4) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        _leadingMiscConstraint.constant = 0.0;
    } else if (_previousIndex == 2 && _currentIndex == 0) {
        _leadingMealConstraint.constant = 0.0;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 2 && _currentIndex == 1) {
        _leadingMealConstraint.constant = self.view.bounds.size.width;
        _leadingMeatConstraint.constant = 0.0;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 2 && _currentIndex == 3) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = 0.0;
        _leadingBeansConstraint.constant = -self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 2 && _currentIndex == 4) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = -self.view.bounds.size.width;
        _leadingMiscConstraint.constant = 0.0;
    } else if (_previousIndex == 3 && _currentIndex == 0) {
        _leadingMealConstraint.constant = 0.0;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = -self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 3 && _currentIndex == 1) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = 0.0;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = -self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 3 && _currentIndex == 2) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        _leadingBeansConstraint.constant = 0.0;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 3 && _currentIndex == 4) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = -self.view.bounds.size.width;
        _leadingBeansConstraint.constant = -self.view.bounds.size.width;
        _leadingMiscConstraint.constant = 0.0;
    } else if (_previousIndex == 4 && _currentIndex == 0) {
        _leadingMealConstraint.constant = 0.0;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = -self.view.bounds.size.width;
        _leadingBeansConstraint.constant = -self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 4 && _currentIndex == 1) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = 0.0;
        _leadingSalsaConstraint.constant = -self.view.bounds.size.width;
        _leadingBeansConstraint.constant = -self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 4 && _currentIndex == 2) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = -self.view.bounds.size.width;
        _leadingBeansConstraint.constant = 0.0;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    } else if (_previousIndex == 4 && _currentIndex == 3) {
        _leadingMealConstraint.constant = -self.view.bounds.size.width;
        _leadingMeatConstraint.constant = -self.view.bounds.size.width;
        _leadingSalsaConstraint.constant = 0.0;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    }
    
    [UIView animateWithDuration:0.35
                          delay: 0.0
                        options: (UIViewAnimationOptionCurveEaseOut)
                     animations:^{
                         
                         [self.view layoutIfNeeded];
                         
                         if (_currentIndex != 4) {
                             _summaryButton.alpha = 0.0;
                         } else {
                             _summaryButton.alpha = 1.0;
                         }
                     }
                     completion:^(BOOL finished){
                         
                         if (_currentIndex == 0) {
                             _leadingMealConstraint.constant = 0.0;
                             _leadingMeatConstraint.constant = self.view.bounds.size.width;
                             _leadingSalsaConstraint.constant = self.view.bounds.size.width;
                             _leadingBeansConstraint.constant = self.view.bounds.size.width;
                             _leadingMiscConstraint.constant = self.view.bounds.size.width;
                         } else if (_currentIndex == 1) {
                             _leadingMealConstraint.constant = -self.view.bounds.size.width;
                             _leadingMeatConstraint.constant = 0.0;
                             _leadingSalsaConstraint.constant = self.view.bounds.size.width;
                             _leadingBeansConstraint.constant = self.view.bounds.size.width;
                             _leadingMiscConstraint.constant = self.view.bounds.size.width;
                         } else if (_currentIndex == 2) {
                             _leadingMealConstraint.constant = -self.view.bounds.size.width;
                             _leadingMeatConstraint.constant = -self.view.bounds.size.width;
                             _leadingSalsaConstraint.constant = self.view.bounds.size.width;
                             _leadingBeansConstraint.constant = 0.0;
                             _leadingMiscConstraint.constant = self.view.bounds.size.width;
                         } else if (_currentIndex == 3) {
                             _leadingMealConstraint.constant = -self.view.bounds.size.width;
                             _leadingMeatConstraint.constant = -self.view.bounds.size.width;
                             _leadingSalsaConstraint.constant = 0.0;
                             _leadingBeansConstraint.constant = -self.view.bounds.size.width;
                             _leadingMiscConstraint.constant = self.view.bounds.size.width;
                         } else if (_currentIndex == 4) {
                             _leadingMealConstraint.constant = -self.view.bounds.size.width;
                             _leadingMeatConstraint.constant = -self.view.bounds.size.width;
                             _leadingSalsaConstraint.constant = -self.view.bounds.size.width;
                             _leadingBeansConstraint.constant = -self.view.bounds.size.width;
                             _leadingMiscConstraint.constant = 0.0;
                         }
                         
                         [self.view layoutIfNeeded];
                         
                         [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                         
                         _previousIndex = _currentIndex;
                     }
     ];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _menuItem = [[CCMenuItem alloc] init];
    
    self.view.backgroundColor = [UIColor cloudsColor];
    
    _adBanner.delegate = self;
    
    _caloriesLabel.text = @"Calories: 0";
    
    _summaryButton.backgroundColor = [UIColor colorWithRed:0.125 green:0.141 blue:0.145 alpha:1];
    _summaryButton.tintColor = [UIColor cloudsColor];
    
    [self loadChildViewControllers];
}

#pragma mark - Create Delegate
- (IBAction)closeAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Load Child Controllers
- (void)loadChildViewControllers {
    
    if (_currentIndex != 4) {
        _summaryButton.alpha = 0.0;
    } else {
        _summaryButton.alpha = 0.0;
    }
    
    UIStoryboard *createStoryboard = [UIStoryboard storyboardWithName:@"CreateMealsRoot" bundle:nil];
    
    if (createStoryboard != nil)
    {
        _mealViewController = [createStoryboard instantiateViewControllerWithIdentifier:@"MealViewController"];
        [UIViewController addChildViewController:_mealViewController toParentViewController:self andAddToView:_mealContainer keepPreviousChildren:nil andRemoveAllOtherChildren:NO withAutoLayout:YES];
        _mealViewController.delegate = self;
        _leadingMealConstraint.constant = 0.0;
        
        _meatViewController = [createStoryboard instantiateViewControllerWithIdentifier:@"MeatViewController"];
        [UIViewController addChildViewController:_meatViewController toParentViewController:self andAddToView:_meatContainer keepPreviousChildren:nil andRemoveAllOtherChildren:NO withAutoLayout:YES];
        _meatViewController.delegate = self;
        _leadingMeatConstraint.constant = self.view.bounds.size.width;
        
        _beansViewController = [createStoryboard instantiateViewControllerWithIdentifier:@"BeansViewController"];
        [UIViewController addChildViewController:_beansViewController toParentViewController:self andAddToView:_beansContainer keepPreviousChildren:nil andRemoveAllOtherChildren:NO withAutoLayout:YES];
        _beansViewController.delegate = self;
        _leadingBeansConstraint.constant = self.view.bounds.size.width;
        
        _salsaViewController = [createStoryboard instantiateViewControllerWithIdentifier:@"SalsaViewController"];
        [UIViewController addChildViewController:_salsaViewController toParentViewController:self andAddToView:_salsaContainer keepPreviousChildren:nil andRemoveAllOtherChildren:NO withAutoLayout:YES];
        _salsaViewController.delegate = self;
        _leadingSalsaConstraint.constant = self.view.bounds.size.width;
        
        _condimentViewController = [createStoryboard instantiateViewControllerWithIdentifier:@"CondimentViewController"];
        [UIViewController addChildViewController:_condimentViewController toParentViewController:self andAddToView:_miscContainer keepPreviousChildren:nil andRemoveAllOtherChildren:NO withAutoLayout:YES];
        _condimentViewController.delegate = self;
        _leadingMiscConstraint.constant = self.view.bounds.size.width;
    }
    
    [self.view layoutIfNeeded];
}

#pragma mark - Delegate Methods
- (void)selectMealTypeWithType:(CCIngredientItem *)type
{
    if (![_menuItem.items containsObject:type]) {
        [_menuItem addIngredientItem:type];
    }
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
    _segmentControl.selectedSegmentIndex = 1;
    [self toggleControllers];
}

- (void)removeMealWithType:(CCIngredientItem *)type
{
    [_menuItem removeIngredientItem:type];
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
    _segmentControl.selectedSegmentIndex = 1;
    [self toggleControllers];
}

- (void)selectMeatWithItem:(CCIngredientItem *)type
{
    if (![_menuItem.items containsObject:type]) {
        [_menuItem addIngredientItem:type];
    }
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
    _segmentControl.selectedSegmentIndex = 2;
    [self toggleControllers];
}

- (void)removeMeatWithItem:(CCIngredientItem *)type {
    [_menuItem removeIngredientItem:type];
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
    _segmentControl.selectedSegmentIndex = 2;
    [self toggleControllers];
}

- (void)selectIngredient:(CCIngredientItem *)ingredient
{
    [_menuItem addIngredientItem:ingredient];
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
}

- (void)removeBeanIngredient:(CCIngredientItem *)ingredient
{
    [_menuItem removeIngredientItem:ingredient];
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
}

- (void)selectSalsaIngredient:(CCIngredientItem *)ingredient
{
    [_menuItem addIngredientItem:ingredient];
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
    _segmentControl.selectedSegmentIndex = 4;
    [self toggleControllers];
}

- (void)removeSalsaIngredient:(CCIngredientItem *)ingredient
{
    [_menuItem removeIngredientItem:ingredient];
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
    _segmentControl.selectedSegmentIndex = 4;
    [self toggleControllers];
}

- (void)selectCondimentIngredient:(CCIngredientItem *)ingredient
{
    [_menuItem addIngredientItem:ingredient];
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
}

- (void)removeCondimentIngredient:(CCIngredientItem *)ingredient
{
    [_menuItem removeIngredientItem:ingredient];
    _caloriesLabel.text = [NSString stringWithFormat:@"Calories: %ld", (long)_menuItem.nutritionTotal.calories];
}

- (void)setSummaryColor:(UIColor *)color
{
    _summaryButton.backgroundColor = color;
    _summaryButton.tintColor = [UIColor cloudsColor];
}

#pragma mark - Ad Delegate Methods
-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad Banner will load ad.");
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad Banner did load ad.");
    
    [UIView animateWithDuration:0.35 animations:^{
        _adBanner.alpha = 1.0;
    }];
}

-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    NSLog(@"Ad Banner action is about to begin.");
    
    return YES;
}



-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
    NSLog(@"Ad Banner action did finish");
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"Unable to show ads. Error: %@", [error localizedDescription]);
}

- (IBAction)summaryAction:(id)sender {
    UIStoryboard *summary = [UIStoryboard storyboardWithName:@"SummaryViewController" bundle:nil];
    SummaryViewController *summaryView = [summary instantiateInitialViewController];
    [self presentViewController:summaryView animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
