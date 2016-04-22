//
//  OtherAppEffectFollowViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 16/4/22.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "OtherAppEffectFollowViewController.h"
#import "JianShuEffectFollowViewController.h"

@interface OtherAppEffectFollowViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OtherAppEffectFollowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setCenterItemWithTitle:@"应用效果仿写"];
    [self configueDataSource];
    [super registerCellWithTableView:self.tableView cellIdentifier:@"OtherAppEffectFollowView"];
    // Do any additional setup after loading the view from its nib.
}

- (void)configueDataSource
{
    [self addARowWithClassName:@"JianShuEffectFollowViewController" andTitle:@"简书效果仿写" isFromSB:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
