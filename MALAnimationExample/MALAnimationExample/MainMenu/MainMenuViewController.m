//
//  MainMenuViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MainMenuViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil)
    {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)addARowWithClassName:(NSString *)className andTitle:(NSString *)cellTitle isFromSB:(BOOL)isFrom
{
    MainMenuModel *model = [[MainMenuModel alloc] initWithClassName:className andTitle:cellTitle];
    model.isFromSB = isFrom;
    model.type = push;
    model.stroryBoardName = @"Main";
    [self.dataSource addObject:model];
}

- (void)addARowWithClassName:(NSString *)className andTitle:(NSString *)cellTitle storyBoardName:(NSString *)storyBoardName
{
    MainMenuModel *model = [[MainMenuModel alloc] initWithClassName:className andTitle:cellTitle];
    model.isFromSB = YES;
    model.type = push;
    model.stroryBoardName = storyBoardName;
    [self.dataSource addObject:model];
}

- (void)addARowWithClassName:(NSString *)className andTitle:(NSString *)cellTitle storyBoardName:(NSString *)storyBoardName tranSationType:(TransationType)type
{
    MainMenuModel *model = [[MainMenuModel alloc] initWithClassName:className andTitle:cellTitle];
    model.isFromSB = YES;
    model.stroryBoardName = storyBoardName;
    model.type = type;
    [self.dataSource addObject:model];
}

- (void)registerCellWithTableView:(UITableView *)tableView cellIdentifier:(NSString *)cellIdentifier
{
    self.cellIdentifier = cellIdentifier;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    MainMenuModel *model = self.dataSource[indexPath.row];
    cell.textLabel.text = model.title;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainMenuModel *model = self.dataSource[indexPath.row];
    UIViewController *vc;
    if (model.isFromSB)
    {
        vc = [StoryBoardWithName(model.stroryBoardName) instantiateViewControllerWithIdentifier:model.className];
    }
    if (vc == nil)
    {
        Class vcClass = NSClassFromString(model.className);
        vc = [[vcClass alloc] initWithNibName:model.className bundle:nil];
    }
    if (model.type == push)
    {
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
