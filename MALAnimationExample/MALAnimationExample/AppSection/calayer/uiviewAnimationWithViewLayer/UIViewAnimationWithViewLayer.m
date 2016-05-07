//
//  UIViewAnimationWithViewLayer.m
//  MALAnimationExample
//
//  Created by wangtian on 16/4/25.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "UIViewAnimationWithViewLayer.h"

@interface UIViewAnimationWithViewLayer ()

@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation UIViewAnimationWithViewLayer

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)beginAnimation:(UIButton *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.testView.layer.transform = [self firstTransform];
    }];
}

- (CATransform3D)firstTransform
{
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    //带点缩小的效果
    t1 = CATransform3DScale(t1, 0.5, 0.5, 1);
    //绕x轴旋转
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);
    return t1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
