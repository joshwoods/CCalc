//
//  DataMigrationManager.m
//  CCalc
//
//  Created by Josh Woods on 1/25/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "DataMigrationManager.h"
#import "AppDelegate.h"
#import "CCIngredientItem.h"
#import "SavedMenuItems.h"
#import "Ingredients.h"
#import "CCMenuItem.h"

@interface DataMigrationManager ()
- (id)initSharedInstance;

// Meals
@property (nonatomic, strong) CCIngredientItem *burrito;
@property (nonatomic, strong) CCIngredientItem *bowl;
@property (nonatomic, strong) CCIngredientItem *softTaco;
@property (nonatomic, strong) CCIngredientItem *hardTaco;

// Meats
@property (nonatomic, strong) CCIngredientItem *steak;
@property (nonatomic, strong) CCIngredientItem *chicken;
@property (nonatomic, strong) CCIngredientItem *carnitas;
@property (nonatomic, strong) CCIngredientItem *barbacoa;

// Beans
@property (nonatomic, strong) CCIngredientItem *fajitas;
@property (nonatomic, strong) CCIngredientItem *wRice;
@property (nonatomic, strong) CCIngredientItem *bRice;
@property (nonatomic, strong) CCIngredientItem *pBeans;
@property (nonatomic, strong) CCIngredientItem *bBeans;

// Salsas
@property (nonatomic, strong) CCIngredientItem *tomato;
@property (nonatomic, strong) CCIngredientItem *tRed;
@property (nonatomic, strong) CCIngredientItem *tGreen;
@property (nonatomic, strong) CCIngredientItem *chili;

// Ingredients
@property (nonatomic, strong) CCIngredientItem *cheese;
@property (nonatomic, strong) CCIngredientItem *lettuce;
@property (nonatomic, strong) CCIngredientItem *guac;
@property (nonatomic, strong) CCIngredientItem *corn;
@property (nonatomic, strong) CCIngredientItem *sourCream;

@end

// Singleton Macro
#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject; \

@implementation DataMigrationManager

- (id)init
{
    return [self initSharedInstance];
}

- (id)initSharedInstance
{
    if (self == [super init]) {
        
        [self setupManagedObjectContext];
        [self setupFetchedResultsController];
        [self setupIngredients];
        
        // Create Fetched Results Controller
        NSError *error;
        if (![[self fetchedResultsController] performFetch:&error]) {
            // Update to handle the error appropriately.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            exit(-1);  // Fail
        }
    }
    
    return self;
}

// singleton initialization
+ (DataMigrationManager *)sharedInstance
{
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    });
}

- (void)setupIngredients
{
    self.burrito = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBurrito];
    self.bowl = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBowl];
    self.hardTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeHardTaco];
    self.softTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSoftTaco];
    
    // Setup Meats
    self.steak= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSteak];
    self.chicken = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChicken];
    self.barbacoa = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBarbacoa];
    self.carnitas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCarnitas];
    
    // Setup Beans
    self.fajitas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeFajitas];
    self.wRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeWRice];
    self.bRice = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBRice];
    self.pBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypePBeans];
    self.bBeans = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBBeans];
    
    // Setup Salsas
    self.tomato = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTomato];
    self.tRed = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTRed];
    self.tGreen = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeTGreen];
    self.chili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChili];
    
    // Setup Ingredients
    self.cheese = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCheese];
    self.corn = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCorn];
    self.guac = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeGuac];
    self.lettuce = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeLettuce];
    self.sourCream = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSourCream];
}

- (void)migrateData
{
    if (self.fetchedResultsController.fetchedObjects.count > 0) {
        
        for (SavedMenuItems *savedItem in self.fetchedResultsController.fetchedObjects) {
            
            // Create a new Menu Item
            CCMenuItem *menuItem = [[CCMenuItem alloc] init];
            
            NSArray *ingredients = [savedItem.details allObjects];
            
            for (Ingredients *ingredient in ingredients) {
                
                if ([ingredient.ingredientName isEqualToString:self.burrito.ingredientName]) {
                    [menuItem addIngredientItem:self.burrito];
                } else if ([ingredient.ingredientName isEqualToString:self.bowl.ingredientName]) {
                    [menuItem addIngredientItem:self.bowl];
                } else if ([ingredient.ingredientName isEqualToString:self.hardTaco.ingredientName]) {
                    [menuItem addIngredientItem:self.hardTaco];
                } else if ([ingredient.ingredientName isEqualToString:self.softTaco.ingredientName]) {
                    [menuItem addIngredientItem:self.softTaco];
                } else if ([ingredient.ingredientName isEqualToString:self.steak.ingredientName]) {
                    [menuItem addIngredientItem:self.steak];
                } else if ([ingredient.ingredientName isEqualToString:self.chicken.ingredientName]) {
                    [menuItem addIngredientItem:self.chicken];
                } else if ([ingredient.ingredientName isEqualToString:self.barbacoa.ingredientName]) {
                    [menuItem addIngredientItem:self.barbacoa];
                } else if ([ingredient.ingredientName isEqualToString:self.carnitas.ingredientName]) {
                    [menuItem addIngredientItem:self.carnitas];
                } else if ([ingredient.ingredientName isEqualToString:self.fajitas.ingredientName]) {
                    [menuItem addIngredientItem:self.fajitas];
                } else if ([ingredient.ingredientName isEqualToString:self.wRice.ingredientName]) {
                    [menuItem addIngredientItem:self.wRice];
                } else if ([ingredient.ingredientName isEqualToString:self.bRice.ingredientName]) {
                    [menuItem addIngredientItem:self.bRice];
                } else if ([ingredient.ingredientName isEqualToString:self.pBeans.ingredientName]) {
                    [menuItem addIngredientItem:self.pBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.bBeans.ingredientName]) {
                    [menuItem addIngredientItem:self.bBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.tomato.ingredientName]) {
                    [menuItem addIngredientItem:self.tomato];
                } else if ([ingredient.ingredientName isEqualToString:self.tRed.ingredientName]) {
                    [menuItem addIngredientItem:self.tRed];
                } else if ([ingredient.ingredientName isEqualToString:self.tGreen.ingredientName]) {
                    [menuItem addIngredientItem:self.tGreen];
                } else if ([ingredient.ingredientName isEqualToString:self.chili.ingredientName]) {
                    [menuItem addIngredientItem:self.chili];
                } else if ([ingredient.ingredientName isEqualToString:self.cheese.ingredientName]) {
                    [menuItem addIngredientItem:self.cheese];
                } else if ([ingredient.ingredientName isEqualToString:self.corn.ingredientName]) {
                    [menuItem addIngredientItem:self.corn];
                } else if ([ingredient.ingredientName isEqualToString:self.guac.ingredientName]) {
                    [menuItem addIngredientItem:self.guac];
                } else if ([ingredient.ingredientName isEqualToString:self.lettuce.ingredientName]) {
                    [menuItem addIngredientItem:self.lettuce];
                } else if ([ingredient.ingredientName isEqualToString:self.sourCream.ingredientName]) {
                    [menuItem addIngredientItem:self.sourCream];
                }
                
                [savedItem removeDetailsObject:ingredient];
            }
            
            // Reassign the correct nutrition totals
            savedItem.calories = [NSString stringWithFormat:@"%ld",(long)menuItem.nutritionTotal.calories];
            savedItem.totalFat = [NSString stringWithFormat:@"%ld g",(long)menuItem.nutritionTotal.totalFat];
            savedItem.saturatedFat = [NSString stringWithFormat:@"%ld g",(long)menuItem.nutritionTotal.saturatedFat];
            savedItem.transFat = [NSString stringWithFormat:@"%ld",(long)menuItem.nutritionTotal.transFat];
            savedItem.cholesterol = [NSString stringWithFormat:@"%ld mg",(long)menuItem.nutritionTotal.cholesterol];
            savedItem.sodium = [NSString stringWithFormat:@"%ld mg",(long)menuItem.nutritionTotal.sodium];
            savedItem.totalCarbs = [NSString stringWithFormat:@"%ld g",(long)menuItem.nutritionTotal.totalCarbs];
            savedItem.dietaryFiber = [NSString stringWithFormat:@"%ld g",(long)menuItem.nutritionTotal.dietaryFiber];
            savedItem.sugar = [NSString stringWithFormat:@"%ld g",(long)menuItem.nutritionTotal.sugar];
            savedItem.protein = [NSString stringWithFormat:@"%ld g",(long)menuItem.nutritionTotal.protein];
            for (CCIngredientItem *item in menuItem.items) {
                Ingredients *ingredient = [NSEntityDescription insertNewObjectForEntityForName:@"Ingredients" inManagedObjectContext:self.managedObjectContext];
                ingredient.ingredientName = item.nutrition.name;
                ingredient.info = savedItem;
                [savedItem addDetailsObject:ingredient];
            }
        }
        
        NSError *saveError;
        if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&saveError]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", saveError, [saveError localizedDescription]);
        }
        else
        {
            NSLog(@"Successfully Updated!");
        }
    }
}

- (void)setupManagedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    self.managedObjectContext = context;
}

- (void)setupFetchedResultsController;
{
    if (_fetchedResultsController != nil) {
        return;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"SavedMenuItems" inManagedObjectContext:self.managedObjectContext]];
    
    NSSortDescriptor *titleDescriptor = [[NSSortDescriptor alloc] initWithKey:@"menuName" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    [fetchRequest setSortDescriptors:@[titleDescriptor]];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    _fetchedResultsController.delegate = self;
    
    NSError *error = nil;
    if (![_fetchedResultsController performFetch:&error]) {
        NSLog(@"Unhandled fetch request error: %@", error);
        NSAssert(NO, @"Unhandled fetch request error: %@", error);
    }
}

@end
