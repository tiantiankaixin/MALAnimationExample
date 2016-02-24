//
//  PopAnimation.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/31.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "PopAnimation.h"
#import "FromViewController.h"
#import "ToViewController.h"

@implementation PopAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    ToViewController *from = (ToViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FromViewController *to = (FromViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    UIImageView *tempImage = [[UIImageView alloc] initWithFrame:from.targetImageView.frame];
    [tempImage setImage:from.targetImageView.image];
    PushCollectionViewCell *cell = (PushCollectionViewCell *)[to.collectionView cellForItemAtIndexPath:to.selectIndexPath];
    CGRect tempImageFrame = [to.view convertRect:cell.icon.frame fromView:cell];
    cell.icon.hidden = YES;
    
    [to.view setFrame:[transitionContext finalFrameForViewController:to]];
    [container insertSubview:to.view belowSubview:from.view];
    [container addSubview:tempImage];
    from.targetImageView.hidden = YES;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        from.view.alpha = 0.0;
        tempImage.frame = tempImageFrame;
        
    } completion:^(BOOL finished) {
        
        if (finished)
        {
            NSLog(@"------%@",from.view.superview);
            cell.icon.hidden = NO;
            [tempImage removeFromSuperview];
            from.targetImageView.hidden = NO;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }
    }];
}

@end
