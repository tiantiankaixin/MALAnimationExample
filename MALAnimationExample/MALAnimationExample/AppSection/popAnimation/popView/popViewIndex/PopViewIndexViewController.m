//
//  PopViewIndexViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/30.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "PopViewIndexViewController.h"

@interface PopViewIndexViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PopViewIndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self configueDataSource];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpView
{
    [self setCenterItemWithTitle:@"自定义弹窗首页"];
    [self registerCellWithTableView:self.tableView cellIdentifier:@"pop"];
}

- (void)configueDataSource
{
    [self addARowWithClassName:@"PopDemoViewController" andTitle:@"中间放大弹窗" isFromSB:YES];
    [self addARowWithClassName:@"SinaPopViewDemoController" andTitle:@"sina pop" isFromSB:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
