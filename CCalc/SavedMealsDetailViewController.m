//
//  SavedMealsDetailViewController.m
//  CCalc
//
//  Created by Josh Woods on 1/22/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "SavedMealsDetailViewController.h"

@interface SavedMealsDetailViewController ()

@property (nonatomic, strong) NSString *menuItemName;

@end

@implementation SavedMealsDetailViewController

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
    
    self.ingredients = [self.menuItem.details allObjects];
    
    self.menuItemName = self.menuItem.menuName;
    
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Name";
            break;
        case 1:
            return @"Nutritional Information";
            break;
        case 2:
            return @"Ingredients";
            break;
        default:
            break;
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 10;
    } else {
        return [self.menuItem.details allObjects].count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"namecell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textLabel.text = self.menuItem.menuName;
        
        return cell;
    } else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = [NSString stringWithFormat:@"Calories: %@", [self.menuItem valueForKey:@"calories"]];
                break;
            case 1:
                cell.textLabel.text = [NSString stringWithFormat:@"Total Fat: %@",[self.menuItem valueForKey:@"totalFat"]];
                break;
            case 2:
                cell.textLabel.text = [NSString stringWithFormat:@"Saturated Fat: %@", [self.menuItem valueForKey:@"saturatedFat"]];
                break;
            case 3:
                cell.textLabel.text = [NSString stringWithFormat:@"Trans Fat: %@", [self.menuItem valueForKey:@"transFat"]];
                break;
            case 4:
                cell.textLabel.text = [NSString stringWithFormat:@"Cholesterol: %@", [self.menuItem valueForKey:@"cholesterol"]];
                break;
            case 5:
                cell.textLabel.text = [NSString stringWithFormat:@"Sodium: %@", [self.menuItem valueForKey:@"sodium"]];
                break;
            case 6:
                cell.textLabel.text = [NSString stringWithFormat:@"Total Carbohydrates: %@", [self.menuItem valueForKey:@"totalCarbs"]];
                break;
            case 7:
                cell.textLabel.text = [NSString stringWithFormat:@"Dietary Fiber: %@", [self.menuItem valueForKey:@"dietaryFiber"]];
                break;
            case 8:
                cell.textLabel.text = [NSString stringWithFormat:@"Sugar: %@", [self.menuItem valueForKey:@"sugar"]];
                break;
            case 9:
                cell.textLabel.text = [NSString stringWithFormat:@"Protein: %@", [self.menuItem valueForKey:@"protein"]];
                break;
            default:
                break;
        }
        
        cell.textLabel.textColor = [self colorWithHex:0xD35400 alpha:1.0];
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        Ingredients *menuIngredient = self.ingredients[indexPath.row];
        cell.textLabel.text = menuIngredient.ingredientName;
        cell.textLabel.textColor = [self colorWithHex:0xD35400 alpha:1.0];
        
        return cell
        ;
    }
}

- (UIColor *)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
    
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Edit your saved meal's name:" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            NSFetchRequest *request = [[NSFetchRequest alloc] init];
            [request setEntity:[NSEntityDescription entityForName:@"SavedMenuItems" inManagedObjectContext:self.managedObjectContext]];
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"menuName == %@", self.menuItem.menuName];
            [request setPredicate:predicate];
            NSError *error = nil;
            NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
            
            SavedMenuItems *saveItem = [results objectAtIndex:0];
            saveItem.menuName = self.menuItemName;

            NSError *saveError;
            if (![self.managedObjectContext save:&saveError]) {
                NSLog(@"Whoops, couldn't save: %@", [saveError localizedDescription]);
            } else {
                [self.tableView reloadData];
            }
            
        }];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
            textField.delegate = self;
            self.menuItemName = textField.text;
        }];
        [alertController addAction:cancel];
        [alertController addAction:okay];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - Textfield

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", str);
    self.menuItemName = str;
    return YES;
}

@end
