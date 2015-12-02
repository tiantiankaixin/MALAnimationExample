//
//  LayerViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/7.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "LayerViewController.h"

@interface LayerViewController ()

@property (nonatomic, strong) CAShapeLayer *shapeLR;
@property (nonatomic, strong) CABasicAnimation *basicA;

@end

@implementation LayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view.
}

#pragma mark - 设置视图
- (void)setUpView
{
    [self setCenterItemWithTitle:@"CALayer"];
    //[self gradLayer];
    [self shapeLayer];
}

#pragma mark - 渐变layer
- (void)gradLayer
{
    CAGradientLayer *gradidentLayer = [CAGradientLayer layer];
    [self.view layoutSubviews];
    gradidentLayer.frame = CGRectMake(0, 64, 100, 100);
    gradidentLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor blueColor].CGColor];
    gradidentLayer.locations = @[@0.2,@0.4,@0.8];
    gradidentLayer.startPoint = CGPointMake(0, 0);
    gradidentLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:gradidentLayer];
}

- (void)shapeLayer
{
    CAShapeLayer *shape = [CAShapeLayer layer];
    CGPathRef ref = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50 + 64) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES].CGPath;
    [shape setPath:ref];
    [self.view.layer addSublayer:shape];
    self.shapeLR = shape;
}

#pragma mark - 开始动画
- (IBAction)animationBtnClick:(UIButton *)sender
{
    CGFloat centerX = self.shapeLR.frame.origin.x + CGRectGetWidth(self.shapeLR.frame) / 2;
    CGFloat centerY = self.shapeLR.frame.origin.y + CGRectGetHeight(self.shapeLR.frame) / 2 - 64;
    //CGFloat radius = CGRectGetHeight(self.shapeLR.frame) / 2;
    CGPathRef ref = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:1000 startAngle:0 endAngle:M_PI * 2 clockwise:YES].CGPath;
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"path"];
    basic.toValue = (__bridge id _Nullable)(ref);
    basic.duration = 10.0f;
    basic.fillMode = kCAFillModeForwards;
    basic.removedOnCompletion = NO;
    [self.shapeLR addAnimation:basic forKey:@"pathAnimation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
