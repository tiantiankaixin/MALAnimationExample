//
//  MainMenuViewController.h
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuModel.h"
@interface MainMenuViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, copy) NSString *cellIdentifier;

- (void)registerCellWithTableView:(UITableView *)tableView cellIdentifier:(NSString *)cellIdentifier;
- (void)addARowWithClassName:(NSString *)className andTitle:(NSString *)cellTitle isFromSB:(BOOL)isFrom;
- (void)addARowWithClassName:(NSString *)className andTitle:(NSString *)cellTitle storyBoardName:(NSString *)storyBoardName;
- (void)addARowWithClassName:(NSString *)className andTitle:(NSString *)cellTitle storyBoardName:(NSString *)storyBoardName tranSationType:(TransationType)type;

@end
