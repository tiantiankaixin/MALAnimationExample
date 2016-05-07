//
//  JianShuEffectFollowViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 16/4/22.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "JianShuEffectFollowViewController.h"
#import "UIView+MALFrame.h"

static CFTimeInterval animationTime = 1.2f;

@interface JianShuEffectFollowViewController ()

@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) CAAnimationGroup *showAnimationGroup;

@end

@implementation JianShuEffectFollowViewController

- (UIView *)maskView
{
    if(_maskView == nil)
    {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0.0f;
    }
    return _maskView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self setCenterItemWithTitle:@"简书添加专题效果仿写"];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpView
{
    //设置景深效果(近大远小)
    CATransform3D transfrom3D = self.navigationController.view.layer.transform;
    transfrom3D.m34 = -1 / 1000.0;
    self.navigationController.view.layer.transform = transfrom3D;
    [self.bottomView setViewSize:CGSizeMake(SCREEN_WIDTH, 400)];
    
    CGRect frame = self.navigationController.view.layer.frame;
    self.navigationController.view.layer.anchorPoint = CGPointMake(0.5, 1);
    self.navigationController.view.layer.frame = frame;
}

- (IBAction)btnClick:(UIButton *)sender
{
    [self showAnimation];
}

- (IBAction)hiddenBtnClick:(UIButton *)sender
{
    [self hiddenAnimation];
}

- (void)showAnimation
{
    //一、self.view上的动画
    //1、self.view沿x轴偏转一定角度并恢复
    CAKeyframeAnimation *xRotaionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.x"];
    xRotaionAnimation.values = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:M_PI_2 / 12],[NSNumber numberWithFloat:0.0]];
    xRotaionAnimation.duration = animationTime;
    
    //2、self.view x缩放
    CABasicAnimation *xScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    xScaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    xScaleAnimation.toValue = [NSNumber numberWithFloat:0.85];
    xScaleAnimation.duration = animationTime;
    
    //y缩放
    CABasicAnimation *yScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    yScaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    yScaleAnimation.toValue = [NSNumber numberWithFloat:0.98];
    yScaleAnimation.duration = animationTime;
    
    //3、z层级改变
//    CABasicAnimation *zAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translate.z"];
//    zAnimation.toValue = [NSNumber numberWithFloat:-30];
//    zAnimation.duration = animationTime;//没卵用
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[xRotaionAnimation, xScaleAnimation, yScaleAnimation];
    group.duration = animationTime;
    [self.navigationController.view.layer addAnimation:group forKey:@"groupAnimation"];
    //[self.navigationController.view.layer setTransform:CATransform3DScale(self.navigationController.view.layer.transform, 0.85, 0.98, 0)];
    group.delegate = self;
    self.showAnimationGroup = group;
   
    //4、视图下方一个view弹出
    UIView *naviSuper = self.navigationController.view.superview;
    if (![self.bottomView isDescendantOfView:naviSuper])
    {
        [naviSuper insertSubview:self.bottomView aboveSubview:self.navigationController.view];
    }
    //5、self.view与弹出view之间加一个蒙层
    if (![self.maskView isDescendantOfView:naviSuper])
    {
        [naviSuper insertSubview:self.maskView belowSubview:self.bottomView];
    }
    [self.bottomView setViewY:SCREEN_HEIGHT];
    [UIView animateWithDuration:animationTime animations:^{
        
        self.bottomView.layer.shadowOffset = CGSizeMake(0, -2);
        self.bottomView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.bottomView.layer.shadowRadius = 2;
        self.bottomView.layer.shadowOpacity = 0.6;
        [self.bottomView setViewY:SCREEN_HEIGHT - HEIGHT(self.bottomView)];
        self.maskView.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        
        if(finished)
        {
            
        }
    }];
}

- (void)hiddenAnimation
{
    self.navigationController.view.layer.transform = CATransform3DIdentity;
    //一、self.view上的动画
    //1、self.view沿x轴偏转一定角度并恢复
    CAKeyframeAnimation *xRotaionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.x"];
    xRotaionAnimation.values = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:M_PI_2 / 4],[NSNumber numberWithFloat:0.0]];
    xRotaionAnimation.duration = animationTime;
    
    //2、self.view x缩放
    CABasicAnimation *xScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    xScaleAnimation.fromValue = [NSNumber numberWithFloat:0.85];
    xScaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    xScaleAnimation.duration = animationTime;
    
    CABasicAnimation *yScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    yScaleAnimation.fromValue = [NSNumber numberWithFloat:0.98];
    yScaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    yScaleAnimation.duration = animationTime;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[xScaleAnimation, yScaleAnimation];
    group.duration = animationTime;
    [self.navigationController.view.layer addAnimation:group forKey:@"groupHiddenAnimation"];
    
    //3、视图下方弹出的view隐藏, 蒙层移除
    [UIView animateWithDuration:animationTime animations:^{
        
        [self.bottomView setViewY:SCREEN_HEIGHT];
        self.maskView.alpha = 0.0;
    } completion:^(BOOL finished) {
        
        if (finished)
        {
            self.navigationController.view.layer.transform = CATransform3DIdentity;
        }
    }];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag)
    {
        
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
