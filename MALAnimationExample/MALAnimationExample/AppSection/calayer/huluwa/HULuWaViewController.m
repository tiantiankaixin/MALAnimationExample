//
//  HULuWaViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 16/2/24.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "HULuWaViewController.h"

@interface HULuWaViewController ()

@property (nonatomic, strong) CALayer *bgLayer;
@property (nonatomic, strong) CALayer *moveLayer;

@end

@implementation HULuWaViewController

- (CALayer *)bgLayer
{
    if (_bgLayer == nil)
    {
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        CGPathRef ref1 = CGPathCreateWithEllipseInRect(CGRectMake(30, 0, 50, 50), NULL);
        CGPathRef ref2 = CGPathCreateWithEllipseInRect(CGRectMake(0, 50, 110, 110), NULL);
        CGMutablePathRef mutableRef = CGPathCreateMutable();
        CGPathAddPath(mutableRef, nil, ref1);
        CGPathAddPath(mutableRef, nil, ref2);
        maskLayer.path = mutableRef;
        maskLayer.fillColor = [UIColor blackColor].CGColor;
        
        _bgLayer = [CALayer layer];
        _bgLayer.frame = CGRectMake(0, 64, 110, 160);
        _bgLayer.backgroundColor = [UIColor redColor].CGColor;
        _bgLayer.mask = maskLayer;
    }
    return _bgLayer;
}

- (CALayer *)moveLayer
{
    if (_moveLayer == nil)
    {
        _moveLayer = [CALayer layer];
        _moveLayer.backgroundColor = [UIColor orangeColor].CGColor;
        _moveLayer.frame = CGRectMake(0, 64, 110, 160);
    }
    return _moveLayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpLayer];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpLayer
{
    [self.bgLayer addSublayer:self.moveLayer];
    self.moveLayer.position = CGPointMake(55, 240);
    [self.view.layer addSublayer:self.bgLayer];
}

- (IBAction)startAnimation:(id)sender
{
    static CGFloat toV = 240;
    static CGFloat fromV = 80;
    if (toV == 240)
    {
        toV = 80;
        fromV = 240;
    }
    else
    {
        toV = 240;
        fromV = 80;
    }
    CABasicAnimation *base = [CABasicAnimation animationWithKeyPath:@"position.y"];
    base.fromValue = [NSNumber numberWithFloat:fromV];
    base.toValue = [NSNumber numberWithFloat:toV];
    base.duration = 3;
    base.fillMode = kCAFillModeForwards;
    base.removedOnCompletion = NO;
    [self.moveLayer addAnimation:base forKey:@"moveAnimation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
