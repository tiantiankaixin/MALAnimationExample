//
//  DissmissAnimation.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/31.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "DissmissAnimation.h"
#import "PFromViewController.h"
#import "PToViewController.h"

@implementation DissmissAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    PToViewController *from = (PToViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    PFromViewController *to = (PFromViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    to.view.layer.zPosition = -1;
    [containerView addSubview:to.view];
    
    NSTimeInterval animationTime = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:animationTime / 2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        [from.view setViewX:-SCREEN_WIDTH /2];
        [to.view setViewX:SCREEN_WIDTH / 2];
        
    } completion:^(BOOL finished) {
        
        if (finished)
        {
            [UIView animateWithDuration:animationTime / 2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                from.view.layer.zPosition = -1;
                to.view.layer.zPosition = 1;
                [from.view setViewX:0];
                [to.view setViewX:0];
                
            } completion:^(BOOL finished) {
                
                if (finished)
                {
                    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                }
            }];
        }
    }];

}

@end
