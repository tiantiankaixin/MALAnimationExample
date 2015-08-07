//
//  MainMenuModel.m
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "MainMenuModel.h"

@implementation MainMenuModel

- (MainMenuModel *)initWithClassName:(NSString *)className andTitle:(NSString *)title
{
    if (self = [super init])
    {
        _className = className;
        _title = title;
        _identifier = className;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",self.title];
}

@end
