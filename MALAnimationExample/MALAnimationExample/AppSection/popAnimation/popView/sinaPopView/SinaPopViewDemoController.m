//
//  SinaPopViewDemoController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/4.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "SinaPopViewDemoController.h"
#import "SinaPopViewController.h"
#import "SinaPopDemoSubViewController.h"

@interface SinaPopViewDemoController ()<SinaPopViewControllerDelegate>

@property (nonatomic, strong) SinaPopViewController *sinaPop;

@end

@implementation SinaPopViewDemoController

- (SinaPopViewController *)sinaPop
{
    if (_sinaPop == nil)
    {
        _sinaPop = [[SinaPopViewController alloc] init];
    }
    return _sinaPop;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self configueSinaPop];
}

- (void)configueSinaPop
{
    self.sinaPop.sinaPopDelegate = self;
    NSMutableArray *titleArray = [NSMutableArray array];
    for (int i = 0; i < 14; i++)
    {
        [titleArray addObject:MALStringFormat(@"%d",i + 1)];
    }
    NSMutableArray *imageArray = [NSMutableArray arrayWithObjects:@"tabbar_compose_camera",@"tabbar_compose_idea",@"tabbar_compose_lbs",@"tabbar_compose_photo",@"tabbar_compose_review",@"tabbar_compose_camera",@"tabbar_compose_idea",@"tabbar_compose_camera",@"tabbar_compose_idea",@"tabbar_compose_lbs",@"tabbar_compose_photo",@"tabbar_compose_review",@"tabbar_compose_camera",@"tabbar_compose_idea", nil];
    self.sinaPop.blurView = self.view;
    [self.sinaPop configueWithTitleArray:titleArray imageArray:imageArray];
}

#pragma mark - 设置视图
- (void)setUpView
{
    [self setCenterItemWithTitle:@"sina pop"];
}
- (IBAction)show:(UIButton *)sender
{
    [self.sinaPop show];
}

#pragma mark - sinaPopView delegate
- (void)menuItemClickWithModel:(MenuItemModel *)model
{
    Log(@"%@",model);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
