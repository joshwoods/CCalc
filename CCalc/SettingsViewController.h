//
//  SettingsViewController.h
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import <UIKit/UIKit.h>
@import SafariServices;
@import MessageUI;
@import StoreKit;

@interface SettingsViewController : UITableViewController <SFSafariViewControllerDelegate, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate, SKProductsRequestDelegate, SKPaymentTransactionObserver>

@end
