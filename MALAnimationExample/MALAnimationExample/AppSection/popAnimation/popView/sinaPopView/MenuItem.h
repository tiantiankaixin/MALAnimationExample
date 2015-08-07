//
//  MenuItem.h
//  MALAnimationExample
//
//  Created by wangtian on 15/8/4.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemModel.h"
@interface MenuItem : UIControl

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

+ (MenuItem *)itemWithModel:(MenuItemModel *)model;


@end
