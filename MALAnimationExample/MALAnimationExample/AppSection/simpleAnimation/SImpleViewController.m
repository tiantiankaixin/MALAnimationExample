//
//  SImpleViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "SImpleViewController.h"

@interface SImpleViewController ()

@end

@implementation SImpleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CAShapeLayer *shap = [[CAShapeLayer alloc] init];
    shap.lineWidth = 2;
    shap.strokeColor = [UIColor orangeColor].CGColor;
    shap.fillColor = [UIColor clearColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 400) radius:50 startAngle:0 endAngle:M_PI / 2 clockwise:YES];
    shap.path = path.CGPath;
    [self.view.layer addSublayer:shap];
    
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    keyFrame.path = CFAutorelease(path.CGPath);
    keyFrame.duration = 4;
    keyFrame.additive = YES;
    keyFrame.repeatCount = HUGE_VALF;
    keyFrame.calculationMode = kCAAnimationPaced;
    keyFrame.rotationMode = kCAAnimationRotateAuto;
    
    //[self.startView.layer addAnimation:keyFrame forKey:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
