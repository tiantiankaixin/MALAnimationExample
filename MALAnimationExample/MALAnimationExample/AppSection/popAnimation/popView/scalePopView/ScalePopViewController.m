//
//  ScalePopViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/30.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "ScalePopViewController.h"
#import <POP.h>
#define ScaleAnimationDuration 0.25
#define ContentView_KeyBoard_Distance 20 //contentView和键盘之间的距离

@interface ScalePopViewController ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation ScalePopViewController

- (UIView *)bgView
{
    if (_bgView == nil)
    {
        _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0.0f;
    }
    return _bgView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self registerKeyboardNotifications];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpView
{
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.bgView];
    [self.view setViewSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    self.contentView.transform = CGAffineTransformScale(self.contentView.transform, 0.01, 0.01);
    self.contentView.alpha = 0.0;
    [self.contentView setCenter:CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)];
    self.contentView.layer.borderWidth = 1;
    self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.contentView.layer.cornerRadius = 6;
    self.contentView.layer.masksToBounds = YES;
    [self.view addSubview:self.contentView];
}

- (void)show
{
    if (![self.view isDescendantOfView:KEYWINDOW])
    {
        [KEYWINDOW addSubview:self.view];
    }
    POPBasicAnimation *alphaAn = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphaAn.toValue = @0.3;
    alphaAn.duration = ScaleAnimationDuration;
    
    POPBasicAnimation *alphaAn1 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphaAn1.toValue = @1.0;
    alphaAn1.duration = ScaleAnimationDuration;
    
    POPSpringAnimation *scaleXY = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scaleXY.springBounciness = 12;//同下
    scaleXY.springSpeed = 10;//0~20 defatult = 4
    //scaleXY.dynamicsFriction = 15.0f;
    scaleXY.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    
    [self.contentView pop_addAnimation:alphaAn1 forKey:@"popViewAlpha"];
    [self.contentView pop_addAnimation:scaleXY forKey:@"popViewScale"];
    [self.bgView pop_addAnimation:alphaAn forKey:@"selfViewAlpha"];
}

- (void)hidden
{
    POPBasicAnimation *alphaAn = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphaAn.toValue = @0.0;
    alphaAn.duration = ScaleAnimationDuration;
    
    POPBasicAnimation *alphaAn1 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphaAn1.toValue = @0.0;
    alphaAn1.duration = ScaleAnimationDuration;
    
    POPBasicAnimation *scaleXY = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scaleXY.toValue = [NSValue valueWithCGPoint:CGPointMake(0.001, 0.001)];
    
    [self.contentView pop_addAnimation:alphaAn1 forKey:@"popViewAlpha"];
    [self.contentView pop_addAnimation:scaleXY forKey:@"popViewScale"];
    [self.bgView pop_addAnimation:alphaAn forKey:@"selfViewAlpha"];
    
    MGCDAfter(ScaleAnimationDuration, ^{
    
        [self.view removeFromSuperview];
    });
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hidden];
}

- (void)registerKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)resignKeyBoardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardShow:(NSNotification *)noti
{
    NSDictionary *userInfo = noti.userInfo;
    CGRect keyBoardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyBoardHeight = keyBoardFrame.size.height;
    CGFloat yContntView = BOTTOM(self.contentView);
    CGFloat needChange = SCREEN_HEIGHT - keyBoardHeight - yContntView - ContentView_KeyBoard_Distance;
    if (needChange < 0)
    {
        [UIView animateWithDuration:ScaleAnimationDuration animations:^{
            
            self.view.transform = CGAffineTransformMakeTranslation(0, needChange);
        }];
    }
}

- (void)keyboardHide:(NSNotification *)noti
{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.view.transform = CGAffineTransformIdentity;
    }];
}

- (void)dealloc
{
    Log(@"%@ dealloc了",NSStringFromClass([self class]));
    [self resignKeyBoardNotifications];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
