//
//  PopIndexViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/6/25.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "PopIndexViewController.h"

@interface PopIndexViewController ()

@end

@implementation PopIndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configueDataSource];
    [self setUpView];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpView
{
    [self setCenterItemWithTitle:@"PopIndex"];
    [self registerCellWithTableView:self.tableView cellIdentifier:@"pop"];
}

- (void)configueDataSource
{
    [super addARowWithClassName:@"PopBasicViewController" andTitle:@"基础"isFromSB:NO];
    [self addARowWithClassName:@"PopViewIndexViewController" andTitle:@"自定义弹窗" isFromSB:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
