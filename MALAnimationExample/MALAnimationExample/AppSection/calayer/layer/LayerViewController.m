//
//  LayerViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/7.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "LayerViewController.h"

@interface LayerViewController ()

@end

@implementation LayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
