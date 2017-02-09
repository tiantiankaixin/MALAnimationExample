//
//  PushAnimation.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/30.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "PushAnimation.h"
#import "FromViewController.h"
#import "ToViewController.h"
#import "UIView+MALFunction.h"

@implementation PushAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    FromViewController *from = (FromViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ToViewController *to = (ToViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    PushCollectionViewCell *cell = (PushCollectionViewCell *)[from.collectionView cellForItemAtIndexPath:from.selectIndexPath];
    UIImageView *iconSnap = [[UIImageView alloc] init];
    iconSnap.frame = [container convertRect:cell.icon.frame fromView:cell];
    iconSnap.image = cell.icon.image;
    cell.icon.hidden = YES;
    
    to.view.frame = [transitionContext finalFrameForViewController:to];
    to.view.alpha = 0;
    
    [container addSubview:to.view];
    [container addSubview:iconSnap];
    
    [to.targetImageView layoutIfNeeded];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        to.view.alpha = 1.0;
        iconSnap.frame = [to targetFrame];
        
    } completion:^(BOOL finished){
        
        if (finished)
        {
            NSLog(@"======%@",from.view.superview);
            cell.icon.hidden = NO;
            to.targetImageView.image = cell.icon.image;
            [iconSnap removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }
    }];
}

@end
