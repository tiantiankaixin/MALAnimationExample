//
//  PFromViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/7/31.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "PFromViewController.h"
#import "PresentAnimation.h"
#import "PToViewController.h"
#import "DissmissAnimation.h"

@interface PFromViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation PFromViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.transitioningDelegate = self;
    // Do any additional setup after loading the view.
}

- (IBAction)back:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    if ([source isKindOfClass:[PFromViewController class]])
    {
        return [PresentAnimation new];
    }
    return nil;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    if ([dismissed isKindOfClass:[PToViewController class]])
    {
        return [DissmissAnimation new];
    }
    else
    {
        self.transitioningDelegate = nil;
    }
    return nil;
}

- (IBAction)present:(UIButton *)sender
{
    PToViewController *to = [self.storyboard instantiateViewControllerWithIdentifier:@"PTo"];
    to.transitioningDelegate = self;
    [self presentViewController:to animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
