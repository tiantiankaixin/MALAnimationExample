//
//  YeguchengViewController.h
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartView.h"

@interface YeguchengViewController : UIViewController

@property (weak, nonatomic) IBOutlet StartView *startView;

- (IBAction)startAction:(UIButton *)sender;

@end
