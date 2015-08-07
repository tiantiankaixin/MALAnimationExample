//
//  IcarouselViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/6.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "IcarouselViewController.h"

@interface IcarouselViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation IcarouselViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self confiugeDatasource];

    // Do any additional setup after loading the view.
}

#pragma mark - 设置视图
- (void)setUpView
{
    [self registerCellWithTableView:self.tableView cellIdentifier:@"carouse"];
    [self setCenterItemWithTitle:@"旋转木马"];
}

- (void)confiugeDatasource
{
    [self addARowWithClassName:@"Cylinder" andTitle:@"Cylinder" storyBoardName:@"ICarousel"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
