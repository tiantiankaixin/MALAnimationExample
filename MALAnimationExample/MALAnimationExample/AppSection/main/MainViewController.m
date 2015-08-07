//
//  MainViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "MainViewController.h"
#import "YeguchengViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setCenterItemWithTitle:@"Main"];
    [self configueDataSource];
    [super registerCellWithTableView:self.tableView cellIdentifier:@"cell"];
    // Do any additional setup after loading the view.
}

- (void)configueDataSource
{
    [self addARowWithClassName:@"YeguchengViewController" andTitle:@"叶孤城" isFromSB:YES];
    [self addARowWithClassName:@"PopIndexViewController" andTitle:@"pop" isFromSB:NO];
    [self addARowWithClassName:@"ZheDieViewController" andTitle:@"折叠效果" isFromSB:NO];
    [self addARowWithClassName:@"TransationIndex" andTitle:@"转场动画" storyBoardName:@"TransationAnimation"];
     [self addARowWithClassName:@"CalyerIndex" andTitle:@"CALayer" storyBoardName:@"Calayer"];
    [self addARowWithClassName:@"carousel" andTitle:@"旋转木马" storyBoardName:@"ICarousel"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
