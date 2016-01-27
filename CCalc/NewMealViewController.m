//
//  NewMealViewController.m
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "NewMealViewController.h"
#import "TotalsViewController.h"
#import "Appirater.h"

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

// Extras
@property (nonatomic, strong) CCIngredientItem *chips;
@property (nonatomic, strong) CCIngredientItem *chipsGuac;
@property (nonatomic, strong) CCIngredientItem *chipsFreshTomato;
@property (nonatomic, strong) CCIngredientItem *chipsChiliCorn;
@property (nonatomic, strong) CCIngredientItem *chipsGreenChili;
@property (nonatomic, strong) CCIngredientItem *chipsRedChili;
@property (nonatomic, strong) CCIngredientItem *patronMargarita;
@property (nonatomic, strong) CCIngredientItem *sauzaMargarita;
@property (nonatomic, strong) NSArray *arrayOfExtras;

@property (nonatomic, strong) NSArray *overallArray;

// Kids Meals
@property (nonatomic, strong) NSArray *arrayOfKidsMeals;

// Kids Meats
@property (nonatomic, strong) NSArray *arrayOfKidsMeats;
// Kids Beans
@property (nonatomic, strong) NSArray *arrayOfKidsBeans;

// Kids Salsas
@property (nonatomic, strong) NSArray *arrayOfKidsSalsas;

// Kids Ingredients
@property (nonatomic, strong) NSArray *arrayOfKidsIngredients;

// Kids Sides
@property (nonatomic, strong) NSArray *arrayOfKidsSides;

// Kids Drinks
@property (nonatomic, strong) NSArray *arrayOfKidsDrinks;


@property (nonatomic, strong) NSArray *kidsOverallArray;


@property (nonatomic, assign) NSInteger menuIndex;

@end

@implementation NewMealViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.menuItem = 0;
    
    self.menuItem = [[CCMenuItem alloc] init];
    
    [self setupIngredients];
    [self setupKidsIngredients];
    
    self.overallArray = @[self.arrayOfMeals, self.arrayOfMeats, self.arrayOfBeans, self.arrayOfSalsas, self.arrayOfCondiments, self.arrayOfExtras];
    self.kidsOverallArray = @[self.arrayOfKidsMeals, self.arrayOfKidsMeats, self.arrayOfKidsBeans, self.arrayOfKidsSalsas, self.arrayOfKidsIngredients, self.arrayOfKidsSides, self.arrayOfKidsDrinks];
    
    self.clearsSelectionOnViewWillAppear = YES;
}

- (void)setupIngredients
{
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
    
    // Setup Extras
    self.chips = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChips];
    self.chipsFreshTomato = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsTomato];
    self.chipsGuac = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsGuac];
    self.chipsChiliCorn = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsChiliCorn];
    self.chipsRedChili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsRedChili];
    self.chipsGreenChili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsGreenChili];
    self.patronMargarita = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypePatronMarg];
    self.sauzaMargarita = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSauzaMarg];
    self.arrayOfExtras = @[self.chips, self.chipsFreshTomato, self.chipsGuac, self.chipsChiliCorn, self.chipsRedChili, self.chipsGreenChili, self.patronMargarita, self.sauzaMargarita];
}

- (void)setupKidsIngredients

{
    
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
    if (self.menuIndex == 0) {
        return 7;
    } else {
        return 8;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.menuIndex == 0) {
        if (section == 6) {
            return 1;
        }
        
        NSArray *array = [self.overallArray objectAtIndex:section];
        return array.count;
    } else {
        if (section == 5) {
            return 1;
        }
        
        NSArray *array = [self.kidsOverallArray objectAtIndex:section];
        return array.count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.menuIndex == 0) {
        switch (section) {
            case 0:
                return @"Meal";
                break;
            case 1:
                return @"Meat";
                break;
            case 2:
                return @"Beans/Rice";
                break;
            case 3:
                return @"Salsa";
                break;
            case 4:
                return @"Condiments";
                break;
            case 5:
                return @"Extras";
                break;
            default:
                break;
        }
    } else {
        switch (section) {
            case 0:
                return @"Meal";
                break;
            case 1:
                return @"Meat";
                break;
            case 2:
                return @"Beans/Rice";
                break;
            case 3:
                return @"Sides";
                break;
            case 4:
                return @"Drinks";
                break;
            default:
                break;
        }
    }
    
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.menuIndex == 0) {
        if (indexPath.section != 6) {
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
    } else {
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
    if (self.menuIndex == 0)
    {
        if (indexPath.section != 6) {
            
            if (indexPath.section != 0 && indexPath.section != 5) {
                if (![self.menuItem isIngredientInMenu:self.burrito] && ![self.menuItem isIngredientInMenu:self.bowl] && ![self.menuItem isIngredientInMenu:self.salad] && ![self.menuItem isIngredientInMenu:self.hardTaco] && ![self.menuItem isIngredientInMenu:self.softTaco] && ![self.menuItem isIngredientInMenu:self.softFlourTaco]) {
                    [tableView deselectRowAtIndexPath:indexPath animated:YES];
                    [self presentSelectMealAlert];
                    return;
                }
            }
            
            NSArray *sectionArray = self.overallArray[indexPath.section];
            CCIngredientItem *ingredient = sectionArray[indexPath.row];
            
            // If we have already added a meal type, advise the user they can only select one
            if (indexPath.section == 0) {
                if (self.selectedMealItem != nil && ![self.selectedMealItem.ingredientName isEqualToString:ingredient.ingredientName])
                {
                    [tableView deselectRowAtIndexPath:indexPath animated:YES];
                    [self presentMealAlreadySelectedAlert];
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
            
            if (self.menuItem.items.count == 0) {
                [tableView deselectRowAtIndexPath:indexPath animated:YES];
                [self presentNoItemsAlert];
            } else {
                [self performSegueWithIdentifier:@"TotalsSegue" sender:self];
            }
        }
    }
    else
    {
        if (indexPath.section != 5) {
            //
        } else {
            if (self.menuItem.items.count == 0) {
                [tableView deselectRowAtIndexPath:indexPath animated:YES];
                [self presentNoItemsAlert];
            } else {
                [self performSegueWithIdentifier:@"TotalsSegue" sender:self];
            }
        }
    }
    
}

- (void)presentNoItemsAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Woops!" message:@"You have no items in this meal. Please add some and then try again!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okay];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)presentMealAlreadySelectedAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Woops!" message:@"It looks like you've already selected a meal type.\n\nIf you wish to choose a different meal type, please remove the previous one and re-select" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okay];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)presentSelectMealAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Woops!" message:@"Please Select a Meal first!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okay];
    [self presentViewController:alert animated:YES completion:nil];
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

- (IBAction)determineMealTypeAction:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Which menu would you like to pick from?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *regular = [UIAlertAction actionWithTitle:@"Regular" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.menuIndex == 1) {
            self.menuIndex = 0;
            [self startOver];
        }
    }];
    UIAlertAction *kids = [UIAlertAction actionWithTitle:@"Kids" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.menuIndex == 0) {
            self.menuIndex = 1;
            [self startOver];
        }
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //
    }];
    [alert addAction:regular];
    [alert addAction:kids];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
