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
    UIView *naviView = self.navigationController.view;
    UIView *naviSuper = naviView.superview;
    if (![self.maskView isDescendantOfView:naviSuper])
    {
        [naviSuper addSubview:self.maskView];
    }
    if (![self.bottomView isDescendantOfView:naviSuper])
    {
        [naviSuper addSubview:self.bottomView];
        [self.bottomView setViewWidth:SCREEN_WIDTH];
    }
    [self.bottomView setViewY:SCREEN_HEIGHT];
    
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
}

- (void)hiddenAnimation
{
    UIView *naviView = self.navigationController.view;
    [UIView animateWithDuration:animationTime / 2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        //maskView隐藏
        [_maskView setAlpha:0.f];
        //popView下降
        [self.bottomView setViewY:SCREEN_HEIGHT];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
