//
//  SettingsViewController.m
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "SettingsViewController.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface SettingsViewController ()

@property (nonatomic, strong) NSArray *productIdentifiers;
@property (nonatomic, strong) SKProductsRequest *request;
@property (nonatomic, strong) NSArray *products;

@property (nonatomic, assign) NSInteger selectedProductIndex;
@property (nonatomic, assign) BOOL transactionInProgress;

@end

static NSString *kRemoveAds = @"com.joshwoods.ccalc.remove_ads";
static NSString *kBOOLKey = @"noBannersTesting1";

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.productIdentifiers = @[kRemoveAds];
    
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    // the only way we can get to this view is if we've already checked canMakePayments
    // there is no need to do the check again here
    [self validateProductIdentifiers];
}

- (void)validateProductIdentifiers
{
    self.request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithArray:self.productIdentifiers]];
    self.request.delegate = self;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.request start];
}

#pragma mark - Payment Delegate

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    self.products = response.products;
    NSLog(@"%lu", (unsigned long)response.products.count);
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions
{
    for (SKPaymentTransaction *transaction in transactions) {
        
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                NSLog(@"Success!");
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                self.transactionInProgress = NO;
                [self setNoBannerDefault];
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"Restored!");
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                self.transactionInProgress = NO;
                [self setNoBannerDefault];
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"Failed!");
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                self.transactionInProgress = NO;
                [self presentErrorAlert];
                break;
            default:
                NSLog(@"%ld", (long)transaction.transactionState);
                break;
        }
    }
}

- (void)setNoBannerDefault
{
    NSUserDefaults *noBannerDefault = [NSUserDefaults standardUserDefaults];
    [noBannerDefault setBool:YES forKey:kBOOLKey];
    [noBannerDefault synchronize];
}

- (void)presentErrorAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Woops!" message:@"It looks like your purchase either failed or was cancelled, please try again!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okay = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okay];
    [self presentViewController:alert animated:YES completion:^{
    }];
}

#pragma mark - Table Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 1;
    } else {
        return 2;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Background color
    view.tintColor = [UIColor clearColor];
    
    // Text Color
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[self colorWithHex:0xD35400 alpha:1.0]];
}

- (UIColor *)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
    
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            if ([SFSafariViewController class]) {
                SFSafariViewController *sfVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.twitter.com/sdoowhsoj"]];
                sfVC.delegate = self;
                [self presentViewController:sfVC animated:YES completion:nil];
            } else {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.twitter.com/sdoowhsoj"]];
            }
        }
        else if (indexPath.row == 1) {
            MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
            controller.mailComposeDelegate = self;
            [controller setToRecipients:@[@"smileykeyapp@gmail.com"]];
            [controller setSubject:@"CCalc!"];
            if ([MFMailComposeViewController canSendMail]) {
                [self presentViewController:controller animated:YES completion:nil];
            }
        }
        else
        {
            if ([SFSafariViewController class]) {
                SFSafariViewController *sfVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.facebook.com/smileykeyapp"]];
                sfVC.delegate = self;
                [self presentViewController:sfVC animated:YES completion:nil];
            } else {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/smileykeyapp"]];
            }
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=848737175&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"]];
        } else {
            NSString *string = @"Hey! I know you like Chipotle, so you should check out CCalculator...it allows you to calculate the nutrition of your meal! You can download it here: https://itunes.apple.com/app/id848737175";
            NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/app/id848737175"];
            UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:@[string, url] applicationActivities:nil];
            
            if (IS_IPAD) {
                // Configure popover for iPad
                [activityController setModalPresentationStyle:UIModalPresentationPopover];
                
                UIPopoverPresentationController *popPresenter = [activityController
                                                                 popoverPresentationController];
                
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
                
                popPresenter.sourceView = self.tableView;
                popPresenter.sourceRect = cell.bounds;
            }
            
            [self.navigationController presentViewController:activityController animated:YES completion:nil];
        }
    } else if (indexPath.section == 2) {
        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setToRecipients:@[@"smileykeyapp@gmail.com"]];
        [controller setSubject:@"CCalc Feedback!"];
        if ([MFMailComposeViewController canSendMail]) {
            [self presentViewController:controller animated:YES completion:nil];
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            
            self.selectedProductIndex = indexPath.row;
            
            if (self.transactionInProgress) {
                return;
            }
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            
            for (SKProduct *product in self.products)
            {
                if ([product.productIdentifier isEqualToString:self.productIdentifiers[indexPath.row]])
                {
                    NSLog(@"%@", product.productIdentifier);
                    NSLog(@"%@", self.productIdentifiers[indexPath.row]);
                    SKMutablePayment *payment = [SKMutablePayment paymentWithProduct:product];
                    payment.quantity = 1;
                    
                    [[SKPaymentQueue defaultQueue] addPayment:payment];
                    self.transactionInProgress = YES;
                }
            }
        } else {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            self.transactionInProgress = YES;
            [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - MessageUI Delegate Methods

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (result == MFMailComposeResultCancelled) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    if (result == MessageComposeResultCancelled) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
