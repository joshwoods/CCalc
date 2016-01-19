//
//  SettingsViewController.m
//  CCalc
//
//  Created by Josh Woods on 1/19/16.
//  Copyright © 2016 joshwoods. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    } else {
        return 1;
    }
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
            if ([SFSafariViewController class]) {
                SFSafariViewController *sfVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.facebook.com/smileykeyapp"]];
                sfVC.delegate = self;
                [self presentViewController:sfVC animated:YES completion:nil];
            } else {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/smileykeyapp"]];
            }
        }
        else
        {
            MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
            controller.mailComposeDelegate = self;
            [controller setToRecipients:@[@"smileykeyapp@gmail.com"]];
            [controller setSubject:@"SmileyKey!"];
            if ([MFMessageComposeViewController canSendText]) {
                [self presentViewController:controller animated:YES completion:nil];
            }
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end