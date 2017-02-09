//
//  ToViewController.h
//  MALAnimationExample
//
//  Created by wangtian on 15/7/30.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *targetImageView;

- (CGRect)targetFrame;

@end
