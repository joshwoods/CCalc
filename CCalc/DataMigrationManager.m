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
@property (nonatomic, strong) CCIngredientItem *salad;
@property (nonatomic, strong) CCIngredientItem *softFlourTaco;

// Meats
@property (nonatomic, strong) CCIngredientItem *steak;
@property (nonatomic, strong) CCIngredientItem *chicken;
@property (nonatomic, strong) CCIngredientItem *carnitas;
@property (nonatomic, strong) CCIngredientItem *barbacoa;
@property (nonatomic, strong) CCIngredientItem *sofritas;

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
@property (nonatomic, strong) CCIngredientItem *vinagrette;

// Extras
@property (nonatomic, strong) CCIngredientItem *chips;
@property (nonatomic, strong) CCIngredientItem *chipsGuac;
@property (nonatomic, strong) CCIngredientItem *chipsFreshTomato;
@property (nonatomic, strong) CCIngredientItem *chipsChiliCorn;
@property (nonatomic, strong) CCIngredientItem *chipsGreenChili;
@property (nonatomic, strong) CCIngredientItem *chipsRedChili;
@property (nonatomic, strong) CCIngredientItem *patronMargarita;
@property (nonatomic, strong) CCIngredientItem *sauzaMargarita;

// Kids Meals
@property (nonatomic, strong) CCIngredientItem *kidsFlour;
@property (nonatomic, strong) CCIngredientItem *kidsCrispy;
@property (nonatomic, strong) CCIngredientItem *kidsSoft;

// Kids Meats
@property (nonatomic, strong) CCIngredientItem *kidsChicken;
@property (nonatomic, strong) CCIngredientItem *kidsSteak;
@property (nonatomic, strong) CCIngredientItem *kidsCarnitas;
@property (nonatomic, strong) CCIngredientItem *kidsBarbacoa;
@property (nonatomic, strong) CCIngredientItem *kidsSofritas;

// Kids Ingredients
@property (nonatomic, strong) CCIngredientItem *kidsGuac;
@property (nonatomic, strong) CCIngredientItem *kidsWRice;
@property (nonatomic, strong) CCIngredientItem *kidsBRice;
@property (nonatomic, strong) CCIngredientItem *kidsBBeans;
@property (nonatomic, strong) CCIngredientItem *kidsPBeans;
@property (nonatomic, strong) CCIngredientItem *kidsFajitas;

// Kids Salsas
@property (nonatomic, strong) CCIngredientItem *kidsTomato;
@property (nonatomic, strong) CCIngredientItem *kidsRoastedCorn;
@property (nonatomic, strong) CCIngredientItem *kidsTRed;
@property (nonatomic, strong) CCIngredientItem *kidsTGreen;

// Kids Ingedients
@property (nonatomic, strong) CCIngredientItem *kidsSourCream;
@property (nonatomic, strong) CCIngredientItem *kidsCheese;
@property (nonatomic, strong) CCIngredientItem *kidsLettuce;

// Kids Sides
@property (nonatomic, strong) CCIngredientItem *kidsMandarins;
@property (nonatomic, strong) CCIngredientItem *kidsChips;
@property (nonatomic, strong) CCIngredientItem *kidsGrapes;

// Kids Drinks
@property (nonatomic, strong) CCIngredientItem *kidsAppleJuice;
@property (nonatomic, strong) CCIngredientItem *kidsOrgMilk;
@property (nonatomic, strong) CCIngredientItem *kidsOrgChocMilk;

// Ques Meals
@property (nonatomic, strong) CCIngredientItem *quesFlour;
@property (nonatomic, strong) CCIngredientItem *quesCorn;
@property (nonatomic, strong) CCIngredientItem *quesCheese;

// Ques Meats
@property (nonatomic, strong) CCIngredientItem *quesChicken;
@property (nonatomic, strong) CCIngredientItem *quesSteak;
@property (nonatomic, strong) CCIngredientItem *quesBarbacoa;
@property (nonatomic, strong) CCIngredientItem *quesCarnitas;
@property (nonatomic, strong) CCIngredientItem *quesSofritas;

@property (nonatomic, strong) CCIngredientItem *quesGuac;
@property (nonatomic, strong) CCIngredientItem *quesWRice;
@property (nonatomic, strong) CCIngredientItem *quesBRice;
@property (nonatomic, strong) CCIngredientItem *quesBBeans;
@property (nonatomic, strong) CCIngredientItem *quesPBeans;

@property (nonatomic, strong) CCIngredientItem *quesMandarins;
@property (nonatomic, strong) CCIngredientItem *quesChips;
@property (nonatomic, strong) CCIngredientItem *quesGrapes;

@property (nonatomic, strong) CCIngredientItem *quesOrgMilk;
@property (nonatomic, strong) CCIngredientItem *quesOrgChocMilk;
@property (nonatomic, strong) CCIngredientItem *quesAppleJuice;

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
    [self setupRegularMealIngredients];
    [self setupRegularKidsMealIngredients];
    [self setupQuesadillaMealIngredients];
}

- (void)setupRegularMealIngredients
{
    // Setup Meals
    self.burrito = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBurrito];
    self.bowl = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBowl];
    self.salad = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSalad];
    self.hardTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeHardTaco];
    self.softTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSoftTaco];
    self.softFlourTaco = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSoftFlourTaco];
    
    // Setup Meats
    self.steak= [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSteak];
    self.chicken = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChicken];
    self.barbacoa = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeBarbacoa];
    self.carnitas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeCarnitas];
    self.sofritas = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSofritas];
    
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
    self.vinagrette = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeVinagrette];
    
    // Setup Extras
    self.chips = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChips];
    self.chipsFreshTomato = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsTomato];
    self.chipsGuac = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsGuac];
    self.chipsChiliCorn = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsChiliCorn];
    self.chipsRedChili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsRedChili];
    self.chipsGreenChili = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeChipsGreenChili];
    self.patronMargarita = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypePatronMarg];
    self.sauzaMargarita = [CCIngredientItem ingredientItemWithType:CCIngredientItemTypeSauzaMarg];
}

- (void)setupRegularKidsMealIngredients
{
    self.kidsFlour = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeSoftFlourTort];
    self.kidsCrispy = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeCrispyCornTort];
    self.kidsSoft = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeSoftCornTort];

    self.kidsChicken = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeChicken];
    self.kidsSteak = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeSteak];
    self.kidsCarnitas = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeCarnitas];
    self.kidsBarbacoa = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeBarbacoa];
    self.kidsSofritas = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeSofritas];

    self.kidsGuac = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeGuac];
    self.kidsWRice = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeWhiteRice];
    self.kidsBRice = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeBrownRice];
    self.kidsBBeans = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeBlackBeans];
    self.kidsPBeans = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypePintoBeans];
    self.kidsFajitas = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeFajitas];

    self.kidsTomato = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeFreshTomato];
    self.kidsRoastedCorn = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeRoastedChili];
    self.kidsTRed = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeTomatilloRed];
    self.kidsTGreen = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeTomatilloGreen];

    self.kidsMandarins = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeMandarins];
    self.kidsGrapes = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeGrapes];
    self.kidsChips = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeChips];

    self.kidsSourCream = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeSourCream];
    self.kidsCheese = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeCheese];
    self.kidsLettuce = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeLettuce];

    self.kidsAppleJuice = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeOrganicAppleJuice];
    self.kidsOrgChocMilk = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeOrganicChocolateMilk];
    self.kidsOrgMilk = [CCIngredientItem ingredientItemWithKidsType:CCIngredientKidsItemTypeOrganicMilk];
}

- (void)setupQuesadillaMealIngredients
{
    self.quesFlour = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeFlourTort];
    self.quesCorn = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeCornTort];
    self.quesCheese = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeCheese];

    self.quesChicken = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeChicken];
    self.quesSteak = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeSteak];
    self.quesCarnitas = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeCarnitas];
    self.quesBarbacoa = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeBarbacoa];
    self.quesSofritas = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeSofritas];

    self.quesGuac = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeGuac];
    self.quesWRice = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeWhiteRice];
    self.quesBRice = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeBrownRice];
    self.quesPBeans = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypePintoBeans];
    self.quesBBeans = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeBlackBeans];

    self.quesMandarins = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeMandarins];
    self.quesBBeans = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeBlackBeans];
    self.quesPBeans = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypePintoBeans];

    self.quesOrgChocMilk = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeOrganicChocolateMilk];
    self.quesOrgMilk = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeOrganicMilk];
    self.quesAppleJuice = [CCIngredientItem ingredientItemWithKidsQuesadillaType:CCIngredientKidsQuesadillaItemTypeOrganicAppleJuice];
}

- (void)migrateData
{
    if (self.fetchedResultsController.fetchedObjects.count > 0) {
        
        for (SavedMenuItems *savedItem in self.fetchedResultsController.fetchedObjects) {
            
            // Create a new Menu Item
            CCMenuItem *menuItem = [[CCMenuItem alloc] init];
            
            NSArray *ingredients = [savedItem.details allObjects];
            
            for (Ingredients *ingredient in ingredients) {
                
                /**
                 *  This is for handling any Regular Meal Options
                 */
                if ([ingredient.ingredientName isEqualToString:self.burrito.oldIngredientName]) {
                    [menuItem addIngredientItem:self.burrito];
                } else if ([ingredient.ingredientName isEqualToString:self.bowl.oldIngredientName]) {
                    [menuItem addIngredientItem:self.bowl];
                } else if ([ingredient.ingredientName isEqualToString:self.hardTaco.oldIngredientName]) {
                    [menuItem addIngredientItem:self.hardTaco];
                } else if ([ingredient.ingredientName isEqualToString:self.softTaco.oldIngredientName]) {
                    [menuItem addIngredientItem:self.softTaco];
                } else if ([ingredient.ingredientName isEqualToString:self.steak.oldIngredientName]) {
                    [menuItem addIngredientItem:self.steak];
                } else if ([ingredient.ingredientName isEqualToString:self.chicken.oldIngredientName]) {
                    [menuItem addIngredientItem:self.chicken];
                } else if ([ingredient.ingredientName isEqualToString:self.barbacoa.oldIngredientName]) {
                    [menuItem addIngredientItem:self.barbacoa];
                } else if ([ingredient.ingredientName isEqualToString:self.carnitas.oldIngredientName]) {
                    [menuItem addIngredientItem:self.carnitas];
                } else if ([ingredient.ingredientName isEqualToString:self.fajitas.oldIngredientName]) {
                    [menuItem addIngredientItem:self.fajitas];
                } else if ([ingredient.ingredientName isEqualToString:self.wRice.oldIngredientName]) {
                    [menuItem addIngredientItem:self.wRice];
                } else if ([ingredient.ingredientName isEqualToString:self.bRice.oldIngredientName]) {
                    [menuItem addIngredientItem:self.bRice];
                } else if ([ingredient.ingredientName isEqualToString:self.pBeans.oldIngredientName]) {
                    [menuItem addIngredientItem:self.pBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.bBeans.oldIngredientName]) {
                    [menuItem addIngredientItem:self.bBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.tomato.oldIngredientName]) {
                    [menuItem addIngredientItem:self.tomato];
                } else if ([ingredient.ingredientName isEqualToString:self.tRed.oldIngredientName]) {
                    [menuItem addIngredientItem:self.tRed];
                } else if ([ingredient.ingredientName isEqualToString:self.tGreen.oldIngredientName]) {
                    [menuItem addIngredientItem:self.tGreen];
                } else if ([ingredient.ingredientName isEqualToString:self.chili.oldIngredientName]) {
                    [menuItem addIngredientItem:self.chili];
                } else if ([ingredient.ingredientName isEqualToString:self.cheese.oldIngredientName]) {
                    [menuItem addIngredientItem:self.cheese];
                } else if ([ingredient.ingredientName isEqualToString:self.corn.oldIngredientName]) {
                    [menuItem addIngredientItem:self.corn];
                } else if ([ingredient.ingredientName isEqualToString:self.guac.oldIngredientName]) {
                    [menuItem addIngredientItem:self.guac];
                } else if ([ingredient.ingredientName isEqualToString:self.lettuce.oldIngredientName]) {
                    [menuItem addIngredientItem:self.lettuce];
                } else if ([ingredient.ingredientName isEqualToString:self.salad.oldIngredientName]) {
                    [menuItem addIngredientItem:self.salad];
                } else if ([ingredient.ingredientName isEqualToString:self.softFlourTaco.oldIngredientName]) {
                    [menuItem addIngredientItem:self.softFlourTaco];
                } else if ([ingredient.ingredientName isEqualToString:self.sofritas.oldIngredientName]) {
                    [menuItem addIngredientItem:self.sofritas];
                } else if ([ingredient.ingredientName isEqualToString:self.chips.oldIngredientName]) {
                    [menuItem addIngredientItem:self.chips];
                } else if ([ingredient.ingredientName isEqualToString:self.chipsFreshTomato.oldIngredientName]) {
                    [menuItem addIngredientItem:self.chipsFreshTomato];
                } else if ([ingredient.ingredientName isEqualToString:self.chipsGuac.oldIngredientName]) {
                    [menuItem addIngredientItem:self.chipsGuac];
                } else if ([ingredient.ingredientName isEqualToString:self.chipsChiliCorn.oldIngredientName]) {
                    [menuItem addIngredientItem:self.chipsChiliCorn];
                } else if ([ingredient.ingredientName isEqualToString:self.chipsRedChili.oldIngredientName]) {
                    [menuItem addIngredientItem:self.chipsRedChili];
                } else if ([ingredient.ingredientName isEqualToString:self.chipsGreenChili.oldIngredientName]) {
                    [menuItem addIngredientItem:self.chipsGreenChili];
                } else if ([ingredient.ingredientName isEqualToString:self.patronMargarita.oldIngredientName]) {
                    [menuItem addIngredientItem:self.patronMargarita];
                } else if ([ingredient.ingredientName isEqualToString:self.sauzaMargarita.oldIngredientName]) {
                    [menuItem addIngredientItem:self.sauzaMargarita];
                }
                
                [savedItem removeDetailsObject:ingredient];
            }
            
            /**
             *  This is for regular Kids Menu Items
             */
            for (Ingredients *ingredient in ingredients) {
                if ([ingredient.ingredientName isEqualToString:self.kidsFlour.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsFlour];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsCrispy.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsCrispy];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsSoft.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsSoft];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsChicken.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsChicken];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsSteak.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsSteak];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsCarnitas.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsCarnitas];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsBarbacoa.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsBarbacoa];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsSofritas.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsSofritas];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsGuac.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsGuac];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsWRice.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsWRice];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsBRice.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsBRice];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsBBeans.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsBBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsPBeans.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsPBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsFajitas.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsFajitas];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsTomato.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsTomato];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsRoastedCorn.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsRoastedCorn];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsTRed.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsTRed];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsTGreen.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsTGreen];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsSourCream.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsSourCream];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsCheese.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsCheese];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsLettuce.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsLettuce];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsMandarins.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsMandarins];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsChips.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsChips];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsGrapes.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsGrapes];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsAppleJuice.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsAppleJuice];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsOrgMilk.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsOrgMilk];
                } else if ([ingredient.ingredientName isEqualToString:self.kidsOrgChocMilk.oldIngredientName]) {
                    [menuItem addIngredientItem:self.kidsOrgChocMilk];
                }
            }
            
            /**
             *  This is for Kids Quesadilla Menu Items
             */
            for (Ingredients *ingredient in ingredients) {
                if ([ingredient.ingredientName isEqualToString:self.quesFlour.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesFlour];
                } else if ([ingredient.ingredientName isEqualToString:self.quesCorn.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesCorn];
                } else if ([ingredient.ingredientName isEqualToString:self.quesCheese.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesCheese];
                } else if ([ingredient.ingredientName isEqualToString:self.quesChicken.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesChicken];
                } else if ([ingredient.ingredientName isEqualToString:self.quesSteak.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesSteak];
                } else if ([ingredient.ingredientName isEqualToString:self.quesCarnitas.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesCarnitas];
                } else if ([ingredient.ingredientName isEqualToString:self.quesBarbacoa.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesBarbacoa];
                } else if ([ingredient.ingredientName isEqualToString:self.quesSofritas.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesSofritas];
                } else if ([ingredient.ingredientName isEqualToString:self.quesGuac.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesGuac];
                } else if ([ingredient.ingredientName isEqualToString:self.quesWRice.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesWRice];
                } else if ([ingredient.ingredientName isEqualToString:self.quesBRice.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesBRice];
                } else if ([ingredient.ingredientName isEqualToString:self.quesPBeans.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesPBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.quesBBeans.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesBBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.quesMandarins.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesMandarins];
                } else if ([ingredient.ingredientName isEqualToString:self.quesBBeans.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesBBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.quesPBeans.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesPBeans];
                } else if ([ingredient.ingredientName isEqualToString:self.quesOrgChocMilk.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesOrgChocMilk];
                } else if ([ingredient.ingredientName isEqualToString:self.quesOrgMilk.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesOrgMilk];
                } else if ([ingredient.ingredientName isEqualToString:self.quesAppleJuice.oldIngredientName]) {
                    [menuItem addIngredientItem:self.quesAppleJuice];
                }
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
                ingredient.ingredientName = item.ingredientName;
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
