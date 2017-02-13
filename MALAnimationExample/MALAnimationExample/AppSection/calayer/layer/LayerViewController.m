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
    [self replicatorLayer];
    //[self gradLayer];
    //[self shapeLayer];
}

#pragma mark - 复制图层
- (void)replicatorLayer
{
//    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
//    replicatorLayer.bounds = CGRectMake(0, 0, 60, 60);
//    replicatorLayer.position = self.view.center;
//    replicatorLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
//    [self.view.layer addSublayer:replicatorLayer];
//    
//    
//    CALayer *bar = [CALayer layer];
//    bar.bounds = CGRectMake(0, 0, 8.0, 40);
//    bar.position = CGPointMake(10, 75);
//    bar.cornerRadius = 2.0;
//    bar.backgroundColor = [UIColor redColor].CGColor;
//    [replicatorLayer addSublayer:bar];
//    
//    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"position.y"];
//    move.toValue = @(bar.position.y - 35.0);
//    move.duration = 0.5f;
//    move.autoreverses = YES;
//    move.repeatCount = MAXFLOAT;
//    [bar addAnimation:move forKey:@"moveAnimation"];
//    
//    replicatorLayer.instanceCount = 2;
//    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0);
//    replicatorLayer.instanceDelay = 0.5f;
//    replicatorLayer.masksToBounds = YES;
//    replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    
//    
    CAReplicatorLayer *r = [CAReplicatorLayer layer];
    r.bounds = CGRectMake(0, 0, 100, 15);
    r.position = CGPointMake(100, 100);
    r.backgroundColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:r];
    
    CAShapeLayer *circle = [CAShapeLayer layer];
    circle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 10, 10)].CGPath;
    circle.strokeColor = [UIColor redColor].CGColor;
    circle.fillColor = [UIColor redColor].CGColor;
    [r addSublayer:circle];
    
    CABasicAnimation *changeColor = [CABasicAnimation animationWithKeyPath:@"opacity"];
    changeColor.toValue = [NSNumber numberWithFloat:0.0];
    changeColor.duration = 0.5f;
    changeColor.autoreverses = YES;
    changeColor.repeatCount = MAXFLOAT;
    [circle addAnimation:changeColor forKey:@"changeColor"];
    
    r.instanceCount = 5;
    r.instanceTransform = CATransform3DMakeTranslation(20, 0, 0);
    r.instanceDelay = 0.3;
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
