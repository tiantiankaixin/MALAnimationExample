//
//  CircleScaleViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/12/2.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "CircleScaleViewController.h"
#import "LayerBtn.h"

@interface CircleScaleViewController ()

@end

@implementation CircleScaleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    LayerBtn *layerBtn = [[LayerBtn alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [layerBtn setTitle:@"测试" forState:(UIControlStateNormal)];
    [layerBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [layerBtn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:layerBtn];
    // Do any additional setup after loading the view from its nib.
}

- (void)btnClick:(LayerBtn *)sender
{
    [sender btnAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
