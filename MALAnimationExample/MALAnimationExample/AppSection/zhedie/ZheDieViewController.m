//
//  ZheDieViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/20.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "ZheDieViewController.h"

typedef void(^PassValueBlock)(NSString *needPassValue);

@interface ZheDieViewController ()
{
    CAGradientLayer *_topLayer;
    CAGradientLayer *_bottomLayer;
}
@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImage;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *tempView;


@end

@implementation ZheDieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpView
{
    self.topImage.image = [UIImage imageNamed:@"zhedie"];
    self.topImage.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    CGRect topOldFrame = self.topImage.frame;
    self.topImage.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.topImage setFrame:topOldFrame];
    _topLayer = [self getShaowLayerWithImageView:self.topImage];
    [self.topImage.layer addSublayer:_topLayer];
    
    self.bottomImage.image = [UIImage imageNamed:@"zhedie"];
    self.bottomImage.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    CGRect bottomOldFrame = self.bottomImage.frame;
    self.bottomImage.layer.anchorPoint = CGPointMake(0.5, 0);
    [self.bottomImage setFrame:bottomOldFrame];
    _bottomLayer = [self getShaowLayerWithImageView:self.bottomImage];
    [self.bottomImage.layer addSublayer:_bottomLayer];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGester:)];
    [self.tempView addGestureRecognizer:pan];
}

- (void)panGester:(UIPanGestureRecognizer *)pan
{
    UIGestureRecognizerState state = pan.state;
    CGPoint location = [pan locationInView:self.tempView];
    BOOL isIn = CGRectContainsPoint(self.tempView.frame, location);
    if (isIn)
    {
        if (state == UIGestureRecognizerStateChanged)
        {
            CGPoint nowPoint = [pan translationInView:self.tempView];
            CGFloat distance = nowPoint.y;
            //NSLog(@"%.2f",nowPoint.y);
            // 初始化形变
            CATransform3D transform3D = CATransform3DIdentity;
            // 设置立体效果
            transform3D.m34 = -1 / 1000.0;
            CGFloat angle = 0.0;
            if (distance > 0)
            {
                // 计算折叠角度，因为需要逆时针旋转，所以取反
                angle = -distance / HEIGHT(self.contentView) * M_PI;
                [self.contentView bringSubviewToFront:self.topImage];
                self.topImage.layer.transform = CATransform3DRotate(transform3D, angle, 1, 0, 0);
            }
            else if (distance < 0)
            {
                angle = -distance / HEIGHT(self.contentView) * M_PI;
                [self.contentView bringSubviewToFront:self.bottomImage];
                self.bottomImage.layer.transform = CATransform3DRotate(transform3D, angle, 1, 0, 0);
            }
            CGFloat progress = ABS(distance) / HEIGHT(self.contentView);
            if (angle < 0)
            {
                _bottomLayer.opacity = progress;
            }
            else
            {
                _topLayer.opacity = progress;
            }
//            else
//            {
//                if (isTop)
//                {
//                    [self.contentView bringSubviewToFront:self.topImage];
//                }
//                else
//                {
//                    [self.contentView bringSubviewToFront:self.bottomImage];
//                }
//            }
        }
        if (state == UIGestureRecognizerStateEnded || state == UIGestureRecognizerStateCancelled)
        {
            [self reloadView];
        }
    }
    else
    {
        [self reloadView];
    }
}

- (void)reloadView
{
    // 还原
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.topImage.layer.transform = CATransform3DIdentity;
        self.bottomImage.layer.transform = CATransform3DIdentity;
        _topLayer.opacity = 0.0;
        _bottomLayer.opacity = 0.0;
        
    } completion:nil];
}

- (CAGradientLayer *)getShaowLayerWithImageView:(UIImageView *)imageView
{
    CAGradientLayer *gradLayer = [CAGradientLayer layer];
    gradLayer.frame = imageView.bounds;
    gradLayer.opacity = 0.0;
    gradLayer.colors = @[(id)[UIColor blackColor].CGColor,(id)[UIColor clearColor].CGColor];
    if ([imageView isEqual:self.topImage])
    {
        gradLayer.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor];
    }
    gradLayer.locations = @[@0.2,@0.8];
    gradLayer.startPoint = CGPointMake(0.5, 0);
    gradLayer.endPoint = CGPointMake(0.5,1);
    return gradLayer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
