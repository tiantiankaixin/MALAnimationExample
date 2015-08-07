//
//  SinaPopDemoSubViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/5.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "SinaPopDemoSubViewController.h"

@interface SinaPopDemoSubViewController ()

@property (weak, nonatomic) IBOutlet UILabel *vcTitleLabel;

@end

@implementation SinaPopDemoSubViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.vcTitleLabel.text = self.vcTitle;
}

- (IBAction)backLastPage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
