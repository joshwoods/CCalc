//
//  InitialViewController.m
//  CCalc
//
//  Created by Josh Woods on 10/18/14.
//  Copyright (c) 2014 com.sdoowhsoj. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()

@property (nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self blurBG];
    // Do any additional setup after loading the view.
}

- (void)blurBG{
    self.image = [UIImage imageNamed:@"burrito"];
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.imageView.image = self.image;
    visualEffectView.frame = self.imageView.bounds;
    [self.imageView addSubview:visualEffectView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
