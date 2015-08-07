//
//  StartView.h
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelScrollView.h"

@protocol StartViewDelegate <NSObject>

@end

@interface StartView : UIView

@property (nonatomic, strong) CAShapeLayer  *circlelayer;
@property (nonatomic, strong) LabelScrollView *numberScrollView1;
@property (nonatomic, strong) LabelScrollView *numberScrollView2;
@property (nonatomic, weak) id<StartViewDelegate> delegate;

- (void)startAnimationWithDuration:(NSUInteger)duration andNumber:(NSInteger)number;

@end
