//
//  MenuItemModel.h
//  MALAnimationExample
//
//  Created by wangtian on 15/8/4.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItemModel : NSObject

@property (nonatomic, copy) NSString *itemTitle;
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, assign) NSInteger idx;
@property (nonatomic, assign) NSInteger pageIdx;
@property (nonatomic, assign) BOOL isMore;

- (MenuItemModel *)initWithTitle:(NSString *)title iconName:(NSString *)iconName;

+ (MenuItemModel *)getMoreModelWithIndex:(NSInteger)index;

@end
