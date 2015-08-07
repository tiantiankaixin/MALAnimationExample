//
//  CalyerViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/3.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "CalyerViewController.h"

@interface CalyerViewController ()

@end

@implementation CalyerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - 设置视图
- (void)setUpView
{
    [self setCenterItemWithTitle:@"CALayer"];
    [self gradLayer];
}

#pragma mark - 渐变layer
- (void)gradLayer
{
    CAGradientLayer *gradidentLayer = [CAGradientLayer layer];
    [self.view layoutSubviews];
    gradidentLayer.frame = CGRectMake(0, 64, 100, 100);
    gradidentLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor blueColor].CGColor];
    gradidentLayer.locations = @[@0.2,@0.4,@0.8];
    gradidentLayer.startPoint = CGPointMake(0, 0);
    gradidentLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:gradidentLayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
