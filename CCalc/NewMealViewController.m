//
//  NewMealViewController.m
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "NewMealViewController.h"
#import "TotalsViewController.h"

@interface NewMealViewController ()

// Meals
@property (nonatomic, strong) CCIngredientItem *burrito;
@property (nonatomic, strong) CCIngredientItem *bowl;
@property (nonatomic, strong) CCIngredientItem *softTaco;
@property (nonatomic, strong) CCIngredientItem *hardTaco;
@property (nonatomic, strong) CCIngredientItem *salad;
@property (nonatomic, strong) CCIngredientItem *softFlourTaco;
@property (nonatomic, strong) NSArray *arrayOfMeals;

@property (nonatomic, strong) CCIngredientItem *selectedMealItem;

// Meats
@property (nonatomic, strong) CCIngredientItem *steak;
@property (nonatomic, strong) CCIngredientItem *chicken;
@property (nonatomic, strong) CCIngredientItem *carnitas;
@property (nonatomic, strong) CCIngredientItem *barbacoa;
@property (nonatomic, strong) CCIngredientItem *sofritas;
@property (nonatomic, strong) NSArray *arrayOfMeats;

// Beans
@property (nonatomic, strong) CCIngredientItem *fajitas;
@property (nonatomic, strong) CCIngredientItem *wRice;
@property (nonatomic, strong) CCIngredientItem *bRice;
@property (nonatomic, strong) CCIngredientItem *pBeans;
@property (nonatomic, strong) CCIngredientItem *bBeans;
@property (nonatomic, strong) NSArray *arrayOfBeans;

// Salsas
@property (nonatomic, strong) CCIngredientItem *tomato;
@property (nonatomic, strong) CCIngredientItem *tRed;
@property (nonatomic, strong) CCIngredientItem *tGreen;
@property (nonatomic, strong) CCIngredientItem *chili;
@property (nonatomic, strong) NSArray *arrayOfSalsas;

// Ingredients
@property (nonatomic, strong) CCIngredientItem *cheese;
@property (nonatomic, strong) CCIngredientItem *lettuce;
@property (nonatomic, strong) CCIngredientItem *guac;
@property (nonatomic, strong) CCIngredientItem *corn;
@property (nonatomic, strong) CCIngredientItem *sourCream;
@property (nonatomic, strong) CCIngredientItem *vinagrette;
@property (nonatomic, strong) NSArray *arrayOfCondiments;

@property (nonatomic, strong) NSArray *overallArray;

@end

@implementation NewMealViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.menuItem = [[CCMenuItem alloc] init];
    
    // Setup Meals
    self.burrito = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBurrito];
    self.bowl = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBowl];
    self.salad = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSalad];
    self.hardTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeHardTaco];
    self.softTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSoftTaco];
    self.softFlourTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSoftFlourTaco];
    self.arrayOfMeals = @[self.burrito, self.bowl, self.salad, self.hardTaco, self.softTaco, self.softFlourTaco];
    
    // Setup Meats
    self.steak= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSteak];
    self.chicken = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChicken];
    self.barbacoa = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBarbacoa];
    self.carnitas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCarnitas];
    self.sofritas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSofritas];
    self.arrayOfMeats = @[self.steak, self.chicken, self.carnitas, self.barbacoa, self.sofritas];
    
    // Setup Beans
    self.fajitas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeFajitas];
    self.wRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeWRice];
    self.bRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBRice];
    self.pBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypePBeans];
    self.bBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBBeans];
    self.arrayOfBeans = @[self.fajitas, self.wRice, self.bRice, self.bBeans, self.pBeans];
    
    // Setup Salsas
    self.tomato = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTomato];
    self.tRed = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTRed];
    self.tGreen = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTGreen];
    self.chili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChili];
    self.arrayOfSalsas = @[self.tomato, self.tRed, self.tGreen, self.chili];
    
    // Setup Ingredients
    self.cheese = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCheese];
    self.corn = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCorn];
    self.guac = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeGuac];
    self.lettuce = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeLettuce];
    self.sourCream = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSourCream];
    self.vinagrette = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeVinagrette];
    
    self.arrayOfCondiments = @[self.cheese, self.corn, self.guac, self.lettuce, self.sourCream, self.vinagrette];
    
    self.overallArray = @[self.arrayOfMeals, self.arrayOfMeats, self.arrayOfBeans, self.arrayOfSalsas, self.arrayOfCondiments];
    
    self.clearsSelectionOnViewWillAppear = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 5) {
        return 1;
    }
    
    NSArray *array = [self.overallArray objectAtIndex:section];
    return array.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Meal";
            break;
        case 1:
            return @"Meat";
            break;
        case 2:
            return @"Beans";
            break;
        case 3:
            return @"Salsa";
            break;
        case 4:
            return @"Condiments";
            break;
        default:
            break;
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != 5) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        
        NSArray *sectionArray = self.overallArray[indexPath.section];
        
        CCIngredientItem *ingredient = sectionArray[indexPath.row];
        cell.textLabel.text = ingredient.ingredientName;
        
        if ([self.menuItem isIngredientInMenu:ingredient]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            NSLog(@"MEEP");
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
            
        }
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TotalsCell" forIndexPath:indexPath];

        return cell;
    }
}

- (UIColor *)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
    
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}

- (void)updateNavTitleWithCalories
{
    NSString *string = nil;

    if (self.menuItem.items.count > 0) {
        
        string = [NSString stringWithFormat:@"Calories: %ld", (long)self.menuItem.nutritionTotal.calories];
    } else {
        string = @"Select Ingredients";
    }
    
    self.navigationItem.title = string;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 5) {
        
        NSArray *sectionArray = self.overallArray[indexPath.section];
        CCIngredientItem *ingredient = sectionArray[indexPath.row];
        
        // If we have already added a meal type, advise the user they can only select one
        if (indexPath.section == 0) {
            if (self.selectedMealItem != nil && ![self.selectedMealItem.ingredientName isEqualToString:ingredient.ingredientName])
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Woops!" message:@"It looks like you've already selected a meal type.\n\nIf you wish to choose a different meal type, please remove the previous one and re-select" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [tableView deselectRowAtIndexPath:indexPath animated:YES];
                }];
                [alert addAction:okay];
                [self presentViewController:alert animated:YES completion:nil];
                
                return;
            }
        }
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if ([self.menuItem isIngredientInMenu:ingredient]) {
            NSLog(@"Removed!");
            
            cell.accessoryType = UITableViewCellAccessoryNone;
            [self.menuItem removeIngredientItem:ingredient];
            
            if (indexPath.section == 0) {
                self.selectedMealItem = nil;
            }
        } else {
            NSLog(@"Adding!");
            
            [self.menuItem addIngredientItem:ingredient];
            
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            if (indexPath.section == 0) {
                self.selectedMealItem = ingredient;
            }
        }
        
        [self updateNavTitleWithCalories];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    } else {
        [self performSegueWithIdentifier:@"TotalsSegue" sender:self];
    }
}

- (IBAction)refreshAction:(id)sender
{
    [self startOver];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TotalsSegue"]) {
        TotalsViewController *vc = [segue destinationViewController];
        vc.delegate = self;
        vc.menuItem = self.menuItem;
    }
}

- (void)startOver
{
    [self.menuItem startOver];
    
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    
    [self.tableView reloadData];
    
    [self updateNavTitleWithCalories];
}

#pragma mark - Totals Delegate

- (void)menuItemSaved
{
    [self startOver];
}

- (void)menuItemStartOver
{
    [self startOver];
}

- (void)menuItemUpdated:(CCMenuItem *)menuItem
{
    self.menuItem = menuItem;

    [self updateNavTitleWithCalories];
    
    [self.tableView reloadData];
}

@end
