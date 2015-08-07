//
//  StartView.m
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "StartView.h"

#define ScrollViewHeight self.bounds.size.height / 5
#define ScrollViewWidth  self.bounds.size.width / 3 / 2

@interface StartView()<UIScrollViewDelegate>


@end

@implementation StartView

#pragma mark - get func
- (CAShapeLayer *)circlelayer
{
    if (_circlelayer == nil)
    {
        _circlelayer = [[CAShapeLayer alloc] init];
        _circlelayer.fillColor = [UIColor clearColor].CGColor;
        _circlelayer.lineWidth = 2;
        _circlelayer.strokeColor = [UIColor redColor].CGColor;
    }
    return _circlelayer;
}

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUpView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setUpView];
    }
    return self;
}

#pragma mark - 初始化视图
- (void)setUpView
{
    CGFloat radius = self.bounds.size.width / 2;
    self.circlelayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:M_PI_2 * 3 endAngle:M_PI_2 * 7 clockwise:YES].CGPath;
    [self.layer addSublayer:self.circlelayer];
    
    self.numberScrollView1 = [[LabelScrollView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2 - ScrollViewWidth, ScrollViewHeight, ScrollViewWidth, ScrollViewHeight) andDataSource:[[NSMutableArray alloc] initWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]]];
    
    self.numberScrollView2 = [[LabelScrollView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2, ScrollViewHeight, ScrollViewWidth, ScrollViewHeight) andDataSource:[[NSMutableArray alloc] initWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]]];
    
    [self addSubview:self.numberScrollView1];
    [self.numberScrollView1 setBackgroundColor:[UIColor redColor]];
    [self.numberScrollView2 setBackgroundColor:[UIColor orangeColor]];
    [self addSubview:self.numberScrollView2];
}


#pragma mark - 开始画圆动画
- (void)startAnimationWithDuration:(NSUInteger)duration andNumber:(NSInteger)number
{
    CABasicAnimation *drawCircle = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawCircle.fromValue = @0;
    drawCircle.toValue = @1.0;
    drawCircle.duration = duration;
    [self.circlelayer addAnimation:drawCircle forKey:nil];
    
    NSInteger shiwei = number / 10;
    NSInteger gewei = number % 10;
    
    [UIView animateKeyframesWithDuration:1.0f delay:0 options:0 animations:^{
        
        [self.numberScrollView1 selectRowWithRow:shiwei];
        
    } completion:nil];
    
    [UIView animateKeyframesWithDuration:0.85f delay:0 options:0 animations:^{
        
        [self.numberScrollView2 selectRowWithRow:gewei];
        
    } completion:nil];
}

- (void)dealloc
{
    
    
}

@end
