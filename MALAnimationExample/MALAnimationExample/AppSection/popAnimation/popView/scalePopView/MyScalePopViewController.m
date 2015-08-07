//
//  MyScalePopViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/30.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "MyScalePopViewController.h"

@interface MyScalePopViewController ()

@property (strong, nonatomic) IBOutlet UIView *popView;

@end

@implementation MyScalePopViewController

- (UIView *)contentView
{
    return self.popView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
