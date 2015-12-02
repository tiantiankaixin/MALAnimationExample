//
//  LayerBtn.m
//  LayerBtn
//
//  Created by wangtian on 15/11/26.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "LayerBtn.h"

@interface LayerBtn()

@property (nonatomic, strong) CAShapeLayer *animationLayer;
@property (nonatomic, strong) CAShapeLayer *borderLayer;

@end

@implementation LayerBtn


- (CAShapeLayer *)animationLayer
{
    if (_animationLayer == nil)
    {
        _animationLayer = [CAShapeLayer layer];
        _animationLayer.fillColor = [UIColor clearColor].CGColor;
        _animationLayer.strokeColor = [UIColor redColor].CGColor;
    }
    return _animationLayer;
}

- (CAShapeLayer *)borderLayer
{
    if (_borderLayer == nil)
    {
        _borderLayer = [CAShapeLayer layer];
        _borderLayer.fillColor = [UIColor clearColor].CGColor;
        _borderLayer.strokeColor = [UIColor redColor].CGColor;
    }
    return _borderLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUpBtn];
    }
    return self;
}

- (void)setUpBtn
{
    self.animationLayer.path = [self circlePathWithAddValue:0].CGPath;
    self.animationLayer.frame = self.bounds;
    self.borderLayer.frame = self.bounds;
    self.borderLayer.path = [self circlePathWithAddValue:0].CGPath;
    [self.layer addSublayer:self.animationLayer];
    [self.layer insertSublayer:self.borderLayer above:self.animationLayer];
}

- (UIBezierPath *)circlePathWithAddValue:(CGFloat)addValue
{
    CGFloat width = CGRectGetWidth(self.bounds) / 2;
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width, width) radius:pow(2, 0.5) * CGRectGetWidth(self.bounds) / 2 + addValue startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    return circlePath;
}

- (void)btnAnimation
{
    UIBezierPath *circlePath = [self circlePathWithAddValue:20];
    
    CABasicAnimation *zoomInAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    zoomInAnimation.toValue = (__bridge id _Nullable)(circlePath.CGPath);
    zoomInAnimation.duration = 1.0f;
    zoomInAnimation.fillMode = kCAFillModeForwards;
    zoomInAnimation.removedOnCompletion = NO;
    [self.animationLayer addAnimation:zoomInAnimation forKey:@"zoomInAnimation"];
    
    CABasicAnimation *hiddenAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    hiddenAnimation.toValue = @0.0f;
    hiddenAnimation.duration = 1.0f;
    hiddenAnimation.fillMode = kCAFillModeForwards;
    hiddenAnimation.removedOnCompletion = NO;
    [self.animationLayer addAnimation:hiddenAnimation forKey:@"hiddenAnimation"];
    
    [self resetAnimationLayer];
}

- (void)resetAnimationLayer
{
    self.animationLayer.path = [self circlePathWithAddValue:0].CGPath;
    self.animationLayer.opacity = 1.0f;
}


@end
