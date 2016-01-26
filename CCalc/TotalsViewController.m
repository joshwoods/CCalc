//
//  TotalsViewController.m
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "TotalsViewController.h"
#import "SavedMenuItems.h"
#import "Ingredients.h"
#import "EditMenuTableViewController.h"

@interface TotalsViewController ()

@property (nonatomic, weak) IBOutlet UILabel *caloriesLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalFatLabel;
@property (nonatomic, weak) IBOutlet UILabel *saturatedFatLabel;
@property (nonatomic, weak) IBOutlet UILabel *transFatLabel;
@property (nonatomic, weak) IBOutlet UILabel *cholesterolLabel;
@property (nonatomic, weak) IBOutlet UILabel *sodiumLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalCarbsLabel;
@property (nonatomic, weak) IBOutlet UILabel *dietaryFiberLabel;
@property (nonatomic, weak) IBOutlet UILabel *sugarLabel;
@property (nonatomic, weak) IBOutlet UILabel *proteinLabel;

@property (nonatomic, assign) BOOL firstLoad;

@end

@implementation TotalsViewController

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstLoad = YES;
    
    [self updateNutritionLabelText];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"View did appear");
    
    if (self.firstLoad) {
        self.firstLoad = NO;
    } else {
        NSLog(@"Update");
        if ([self.delegate respondsToSelector:@selector(menuItemUpdated:)]) {
            [self.delegate menuItemUpdated:self.menuItem];
        }

    }
}

#pragma mark - Table view data source

- (void)updateNutritionLabelText
{
    self.caloriesLabel.text = [NSString stringWithFormat:@"%ld", (long)self.menuItem.nutritionTotal.calories];
    self.totalFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.totalFat];
    self.saturatedFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.saturatedFat];
    self.transFatLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.transFat];
    self.cholesterolLabel.text = [NSString stringWithFormat:@"%ld mg", (long)self.menuItem.nutritionTotal.cholesterol];
    self.sodiumLabel.text = [NSString stringWithFormat:@"%ld mg", (long)self.menuItem.nutritionTotal.sodium];
    self.totalCarbsLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.totalCarbs];
    self.dietaryFiberLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.dietaryFiber];
    self.sugarLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.sugar];
    self.proteinLabel.text = [NSString stringWithFormat:@"%ld g", (long)self.menuItem.nutritionTotal.protein];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    } else {
        return 3;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1 && indexPath.row == 0) { // Edit
        
        if (self.menuItem.items.count == 0) {
            [self presentNoItemsAlert];
        } else {
            [self performSegueWithIdentifier:@"EditSegue" sender:self];
        }
    } else if (indexPath.section == 1 && indexPath.row == 1) { // Save
        
        if (self.menuItem.items.count == 0) {
            [self presentNoItemsAlert];
        } else {
            [self presentSaveAlert];
        }
    } else if (indexPath.section == 1 && indexPath.row == 2) { // Start Over
        
        if ([self.delegate respondsToSelector:@selector(menuItemStartOver)]) {
            [self.delegate menuItemStartOver];
        }
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)presentSaveAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Name your meal:" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSManagedObjectContext *context = [self managedObjectContext];
        SavedMenuItems *savedInfo = [NSEntityDescription
                                     insertNewObjectForEntityForName:@"SavedMenuItems"
                                     inManagedObjectContext:context];
        savedInfo.menuName = self.menuItemName;
        savedInfo.calories = [NSString stringWithFormat:@"%ld",(long)self.menuItem.nutritionTotal.calories];
        savedInfo.totalFat = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.totalFat];
        savedInfo.saturatedFat = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.saturatedFat];
        savedInfo.transFat = [NSString stringWithFormat:@"%ld",(long)self.menuItem.nutritionTotal.transFat];
        savedInfo.cholesterol = [NSString stringWithFormat:@"%ld mg",(long)self.menuItem.nutritionTotal.cholesterol];
        savedInfo.sodium = [NSString stringWithFormat:@"%ld mg",(long)self.menuItem.nutritionTotal.sodium];
        savedInfo.totalCarbs = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.totalCarbs];
        savedInfo.dietaryFiber = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.dietaryFiber];
        savedInfo.sugar = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.sugar];
        savedInfo.protein = [NSString stringWithFormat:@"%ld g",(long)self.menuItem.nutritionTotal.protein];
        for (CCIngredientItem *item in self.menuItem.items) {
            Ingredients *ingredient = [NSEntityDescription insertNewObjectForEntityForName:@"Ingredients" inManagedObjectContext:context];
            ingredient.ingredientName = item.nutrition.name;
            ingredient.info = savedInfo;
            [savedInfo addDetailsObject:ingredient];
        }
        
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        
        if ([self.delegate respondsToSelector:@selector(menuItemSaved)]) {
            [self.delegate menuItemSaved];
        }
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        textField.delegate = self;
        textField.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:[NSDate date]]];
        self.menuItemName = textField.text;
    }];
    [alertController addAction:cancel];
    [alertController addAction:okay];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Alert
- (void)presentNoItemsAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Woops!" message:@"You have no items in this meal. Please add some and then try again!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okay];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Textfield

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", str);
    self.menuItemName = str;
    return YES;
}

#pragma mark - Editing

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"EditSegue"]) {
        UINavigationController *nav = [segue destinationViewController];
        EditMenuTableViewController *vc = [[nav viewControllers] objectAtIndex:0];
        vc.delegate = self;
        vc.menuItem = self.menuItem;
    }
}

- (void)updateMenuItemWithMenuItem:(CCMenuItem *)menuItem
{
    self.menuItem = menuItem;
    [self updateNutritionLabelText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
