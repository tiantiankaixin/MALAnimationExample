//
//  SinaPopViewController.h
//  MALAnimationExample
//
//  Created by wangtian on 15/8/4.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

typedef enum{

    popPush,
    popPresent

}PopTranSationType;

@protocol SinaPopViewControllerDelegate <NSObject>

- (void)menuItemClickWithModel:(MenuItemModel *)model;

@end

@interface SinaPopViewController : UIViewController

@property (nonatomic, copy) void(^selectDoneBlock)(NSInteger idx);
@property (nonatomic, assign, readonly) NSInteger itemCount;
@property (nonatomic, assign, readonly) NSInteger pageCount;
@property (nonatomic, weak) UIView *blurView;
@property (nonatomic, weak) id<SinaPopViewControllerDelegate> sinaPopDelegate;


- (void)configueWithTitleArray:(NSMutableArray *)titleArray imageArray:(NSMutableArray *)imageArray;

- (void)show;

@end
