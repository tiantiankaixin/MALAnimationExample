//
//  TransationIndexViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/31.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "TransationIndexViewController.h"

@interface TransationIndexViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TransationIndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self configueDataSource];
    // Do any additional setup after loading the view.
}

#pragma mark - 设置视图
- (void)setUpView
{
    [self registerCellWithTableView:self.tableView cellIdentifier:@"cell"];
}

#pragma mark - 配置数据源
- (void)configueDataSource
{
    [self addARowWithClassName:@"FromVC" andTitle:@"push" storyBoardName:@"TransationAnimation"];
    [self addARowWithClassName:@"PFrom" andTitle:@"present" storyBoardName:@"TransationAnimation" tranSationType:present];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
