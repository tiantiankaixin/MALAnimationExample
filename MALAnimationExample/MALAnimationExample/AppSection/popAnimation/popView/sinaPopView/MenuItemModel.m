//
//  MenuItemModel.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/4.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "MenuItemModel.h"

@implementation MenuItemModel

- (MenuItemModel *)initWithTitle:(NSString *)title iconName:(NSString *)iconName
{
    if (self = [super init])
    {
        self.itemTitle = title;
        self.iconName = iconName;
        self.isMore = NO;
        if ([title isEqualToString:@"更多"])
        {
            self.isMore = YES;
        }
    }
    return self;
}

+ (MenuItemModel *)getMoreModelWithIndex:(NSInteger)index
{
    MenuItemModel *moreModel = [[MenuItemModel alloc] initWithTitle:@"更多" iconName:@"tabbar_compose_more"];
    moreModel.isMore = YES;
    moreModel.idx = index;
    return moreModel;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",self.itemTitle];
}

@end
