//
//  LabelScrollView.h
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelScrollView : UIScrollView

@property (nonatomic, strong) NSMutableArray *data;

- (LabelScrollView *)initWithFrame:(CGRect)frame andDataSource:(NSMutableArray *)dataSource;

- (void)selectRowWithRow:(NSInteger)row;

@end
