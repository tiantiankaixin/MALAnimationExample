//
//  PopBasicViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/6/25.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "PopBasicViewController.h"
#import <pop.h>

@interface PopBasicViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation PopBasicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)beginAnimation:(UIButton *)sender
{
    //[self popSpringAnimation];
    //[self changeColor];
    [self propertyAnimation];
}

#pragma mark - POPBasicAnimation
- (void)popBasicAnimation
{
    NSInteger height = CGRectGetHeight(self.view.bounds);
    NSInteger width = CGRectGetWidth(self.view.bounds);
    
    CGFloat centerX = arc4random() % width;
    CGFloat centerY = arc4random() % height;
    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.duration = 0.4;
    [self.testView pop_addAnimation:anim forKey:@"centerAnimation"];
}

#pragma mark - 弹性动画
- (void)popSpringAnimation
{
    //移动动画
    /*
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    
    NSInteger height = CGRectGetHeight(self.view.bounds);
    NSInteger width = CGRectGetWidth(self.view.bounds);
    
    CGFloat centerX = arc4random() % width;
    CGFloat centerY = arc4random() % height;
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
    anim.springBounciness = 16;
    anim.springSpeed = 6;
    [self.testView pop_addAnimation:anim forKey:@"center"];
     */
    
    //放大动画
    CGFloat viewW = arc4random() % 300;
    CGFloat viewH = arc4random() % 300;
    POPSpringAnimation *scaleAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewSize];
    scaleAnim.toValue = [NSValue valueWithCGSize:CGSizeMake(viewW, viewH)];
    scaleAnim.springSpeed = 3;
    scaleAnim.dynamicsFriction = 5.0f;
    [self.testView pop_addAnimation:scaleAnim forKey:@"scale"];
}

#pragma mark - 衰减动画
- (void)decayAnimation
{
//    POPDecayAnimation *popDecayAm = [POPDecayAnimation animationWithPropertyNamed:kPOPViewSize];
}

#pragma mark - 改变颜色
- (void)changeColor
{
    POPBasicAnimation *p_ChangeClolor = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
    p_ChangeClolor.toValue = [UIColor redColor];
    p_ChangeClolor.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    p_ChangeClolor.duration = 0.5f;
    [self.testView pop_addAnimation:p_ChangeClolor forKey:@"changeColor"];
    
    
//    POPSpringAnimation *s_changeColor = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
//    s_changeColor.toValue = [UIColor redColor];
//    s_changeColor.springSpeed = 5;
//    [self.testView pop_addAnimation:s_changeColor forKey:@"sChangeColor"];
}

#pragma mark - 属性动画
- (void)propertyAnimation
{
    [self.testLabel pop_removeAllAnimations];
    POPBasicAnimation *anim = [POPBasicAnimation animation];
    anim.duration = 20.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    POPAnimatableProperty * prop = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) {
        // read value
        prop.readBlock = ^(id obj, CGFloat values[]) {
            
            values[0] = [[obj text] floatValue];
        };
        // write value
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
           
            CGFloat value = values[0];
            NSLog(@"-----------");
            [obj setText:[NSString stringWithFormat:@"%.2f",value]];
        };
        // dynamics threshold
        prop.threshold = 0.01;
    }];
    
    anim.property = prop;
    anim.fromValue = @(0);
    anim.toValue = @(20);
    [self.testLabel pop_addAnimation:anim forKey:@"counting"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
