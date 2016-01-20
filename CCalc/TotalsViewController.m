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
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
    
    if (indexPath.section == 1 && indexPath.row == 0) { // Edit
        //
    } else if (indexPath.section == 1 && indexPath.row == 1) { // Save
        [self presentSaveAlert];
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

#pragma mark - Textfield

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", str);
    self.menuItemName = str;
    return YES;
}

#pragma mark - Edit Delegate

- (void)updateMenuItemWithMenuItem:(CCMenuItem *)menuItem
{
    _menuItem = menuItem;
    [self.tableView reloadData];
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
