//
//  CALayerIndexViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/6.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "CALayerIndexViewController.h"

@interface CALayerIndexViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation CALayerIndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self configueDatasource];
    // Do any additional setup after loading the view.
}

#pragma mark - 设置视图
- (void)setUpView
{
    [self setCenterItemWithTitle:@"CALayerIndex"];
    [self registerCellWithTableView:self.tableView cellIdentifier:@"calayer"];
}

#pragma mark - 配置数据源
- (void)configueDatasource
{
    [self addARowWithClassName:@"selectColor" andTitle:@"提取图片上的颜色" storyBoardName:@"Calayer"];
    [self addARowWithClassName:@"layer" andTitle:@"layer" storyBoardName:@"Calayer"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
