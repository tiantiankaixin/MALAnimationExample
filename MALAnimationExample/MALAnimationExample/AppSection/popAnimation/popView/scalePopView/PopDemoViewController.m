//
//  PopDemoViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/30.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "PopDemoViewController.h"
#import "MyScalePopViewController.h"

@interface PopDemoViewController ()

@property (nonatomic, strong) MyScalePopViewController *scalePop;

@end

@implementation PopDemoViewController

- (MyScalePopViewController *)scalePop
{
    if (_scalePop == nil)
    {
        _scalePop = [[MyScalePopViewController alloc] init];
    }
    return _scalePop;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setCenterItemWithTitle:@"中间放大弹窗"];
    // Do any additional setup after loading the view.
}
- (IBAction)showPop:(UIButton *)sender
{
    [self.scalePop show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
