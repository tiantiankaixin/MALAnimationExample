//
//  JianShuEffectFollowViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 16/4/22.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "JianShuEffectFollowViewController.h"
#import "UIView+MALFrame.h"

static CFTimeInterval animationTime = 0.6f;

@interface JianShuEffectFollowViewController ()<UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) CAAnimationGroup *showAnimationGroup;
@property (nonatomic, strong) AnimationDelegate *aniDelegate;

@end

@implementation JianShuEffectFollowViewController

- (UIView *)maskView
{
    if(_maskView == nil)
    {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0.0f;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
        tap.delegate = self;
        [_maskView addGestureRecognizer:tap];
    }
    return _maskView;
}

- (void)tapGes:(UITapGestureRecognizer *)ts
{
    [self hiddenAnimation];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    UIView *view = [gestureRecognizer view];
    if ([view isEqual:self.maskView])
    {
        return YES;
    }
    return NO;
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
    self.bottomView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    self.bottomView.layer.shadowOpacity = 0.8;
    self.bottomView.layer.shadowRadius = 5;
    CGRect frame = self.navigationController.view.frame;
    self.navigationController.view.layer.anchorPoint = CGPointMake(0.5, 1.0);
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
<<<<<<< HEAD
    //一、self.view上的动画
    //1、self.view沿x轴偏转一定角度并恢复
//    CAKeyframeAnimation *xRotaionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.x"];
//    xRotaionAnimation.values = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:M_PI_2 / 12],[NSNumber numberWithFloat:0.0]];
//    xRotaionAnimation.duration = animationTime / 2;
    
    //2、self.view x缩放
//    CABasicAnimation *xScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
//    xScaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//    xScaleAnimation.toValue = [NSNumber numberWithFloat:0.85];
//    xScaleAnimation.duration = animationTime / 2;
//    xScaleAnimation.beginTime = animationTime / 2;
//    
//    //y缩放
//    CABasicAnimation *yScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
//    yScaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//    yScaleAnimation.toValue = [NSNumber numberWithFloat:0.98];
//    yScaleAnimation.duration = animationTime / 2;
//    yScaleAnimation.beginTime = animationTime / 2;
    
    //3、z层级改变
//    CABasicAnimation *zAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translate.z"];
//    zAnimation.toValue = [NSNumber numberWithFloat:-30];
//    zAnimation.duration = animationTime;//没卵用
//    
//    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
//    group.animations = @[xRotaionAnimation, xScaleAnimation, yScaleAnimation];
//    group.duration = animationTime;
//    [self.navigationController.view.layer addAnimation:group forKey:@"groupAnimation"];
   // self.navigationController.view.transform = CGAffineTransformMakeScale(0.85, 0.98);
//    AnimationDelegate *animation = [[AnimationDelegate alloc] init];
//    group.delegate = animation;
//    self.showAnimationGroup = group;
//    self.aniDelegate = animation;
   
    //4、视图下方一个view弹出
    UIView *naviSuper = self.navigationController.view.superview;
    if (![self.bottomView isDescendantOfView:naviSuper])
=======
    UIView *naviView = self.navigationController.view;
    UIView *naviSuper = naviView.superview;
    if (![self.maskView isDescendantOfView:naviSuper])
>>>>>>> 206538944426db137d015702657c14edfed2a76e
    {
        [naviSuper addSubview:self.maskView];
    }
    if (![self.bottomView isDescendantOfView:naviSuper])
    {
        [naviSuper addSubview:self.bottomView];
        [self.bottomView setViewWidth:SCREEN_WIDTH];
    }
    [self.bottomView setViewY:SCREEN_HEIGHT];
<<<<<<< HEAD
    [UIView animateWithDuration:animationTime delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
        self.bottomView.layer.shadowOffset = CGSizeMake(0, -2);
        self.bottomView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.bottomView.layer.shadowRadius = 2;
        self.bottomView.layer.shadowOpacity = 0.6;
        [self.bottomView setViewY:SCREEN_HEIGHT - HEIGHT(self.bottomView)];
        self.maskView.alpha = 0.5;
        self.navigationController.view.transform = CGAffineTransformMakeScale(0.85, 0.98);
        
    } completion:nil];
=======
    
    [UIView animateWithDuration:animationTime / 2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
         [naviView.layer setTransform:[self firstTransform]];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:animationTime / 2 animations:^{
            
            [naviView.layer setTransform:[self secondTransform]];
            //显示maskView
            [_maskView setAlpha:0.5f];
            //popView上升
            [self.bottomView setViewY:SCREEN_HEIGHT - HEIGHT(self.bottomView)];
        }];
        
    }];
>>>>>>> 206538944426db137d015702657c14edfed2a76e
}

- (void)hiddenAnimation
{
<<<<<<< HEAD
    //self.navigationController.view.layer.transform = CATransform3DIdentity;
    //一、self.view上的动画
    //1、self.view沿x轴偏转一定角度并恢复
    CAKeyframeAnimation *xRotaionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.x"];
    xRotaionAnimation.values = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:M_PI_2 / 4],[NSNumber numberWithFloat:0.0]];
    xRotaionAnimation.duration = animationTime;
    
    //2、self.view x缩放
//    CABasicAnimation *xScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
//    xScaleAnimation.fromValue = [NSNumber numberWithFloat:0.85];
//    xScaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
//    xScaleAnimation.duration = animationTime;
//    
//    CABasicAnimation *yScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
//    yScaleAnimation.fromValue = [NSNumber numberWithFloat:0.98];
//    yScaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
//    yScaleAnimation.duration = animationTime;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[xRotaionAnimation];
    group.duration = animationTime;
    //[self.navigationController.view.layer addAnimation:group forKey:@"groupHiddenAnimation"];
    
    //3、视图下方弹出的view隐藏, 蒙层移除
    [UIView animateWithDuration:animationTime animations:^{
=======
    UIView *naviView = self.navigationController.view;
    [UIView animateWithDuration:animationTime / 2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
>>>>>>> 206538944426db137d015702657c14edfed2a76e
        
        //maskView隐藏
        [_maskView setAlpha:0.f];
        //popView下降
        [self.bottomView setViewY:SCREEN_HEIGHT];
<<<<<<< HEAD
        self.maskView.alpha = 0.0;
        self.navigationController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


@implementation AnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
=======
        //同时进行 感觉更丝滑
        [naviView.layer setTransform:[self firstTransform]];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:animationTime / 2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //变为初始值
            [naviView.layer setTransform:CATransform3DIdentity];
            
        } completion:^(BOOL finished){
            
            //移除
            [self.bottomView removeFromSuperview];
        }];
        
    }];
}

- (CATransform3D)firstTransform
>>>>>>> 206538944426db137d015702657c14edfed2a76e
{
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    //带点缩小的效果
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    //绕x轴旋转
    t1 = CATransform3DRotate(t1, 6 * M_PI/180.0, 1, 0, 0);
    return t1;
    
}

- (CATransform3D)secondTransform
{
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = [self firstTransform].m34;
    //向上移
    t2 = CATransform3DTranslate(t2, 0, self.view.frame.size.height * (-0.15), 0);
    //第二次缩小
    t2 = CATransform3DScale(t2, 0.8, 0.8, 1);
    return t2;
}

@end

