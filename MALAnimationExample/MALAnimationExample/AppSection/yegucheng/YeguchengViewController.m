//
//  YeguchengViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "YeguchengViewController.h"

@interface YeguchengViewController ()<StartViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation YeguchengViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.startView.delegate = self;
}

- (IBAction)startAction:(UIButton *)sender
{
    NSInteger num = arc4random_uniform(100);
    [self.startView startAnimationWithDuration:0.5f andNumber:num];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{

}

@end
