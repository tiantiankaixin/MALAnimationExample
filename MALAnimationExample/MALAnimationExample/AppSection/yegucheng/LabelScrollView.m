//
//  LabelScrollView.m
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "LabelScrollView.h"

@implementation LabelScrollView

- (LabelScrollView *)initWithFrame:(CGRect)frame andDataSource:(NSArray *)dataSource
{
    if (self = [super initWithFrame:frame])
    {
        _data = [[NSMutableArray alloc] initWithArray:dataSource];
        [self setUpScrollView];
    }
    return self;
}

#pragma mark - 获得滚动视图上的label
- (UILabel *)getALabelWithSize:(CGSize)labelSize andTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelSize.width, labelSize.height)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blueColor];
    return label;
}

#pragma mark - 初始化scrollView
- (void)setUpScrollView
{
    CGSize scrollViewSize = self.bounds.size;
    for (int row = 0; row < self.data.count; row++)
    {
        UILabel *label = [self getALabelWithSize:CGSizeMake(scrollViewSize.width, scrollViewSize.height) andTitle:self.data[row]];
        CGRect labelFrame = label.frame;
        labelFrame.origin.x =  0;
        labelFrame.origin.y = row * scrollViewSize.height;
        label.frame = labelFrame;
        [self addSubview:label];
    }
    self.contentSize = CGSizeMake(0, scrollViewSize.height * self.data.count);
}

- (void)selectRowWithRow:(NSInteger)row
{
    [self setContentOffset:CGPointMake(0, row * self.bounds.size.height)];
}

- (void)dealloc
{

}

@end
