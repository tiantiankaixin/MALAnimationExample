//
//  MenuItem.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/4.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

+ (MenuItem *)itemWithModel:(MenuItemModel *)model
{
    MenuItem *item = [[[NSBundle mainBundle] loadNibNamed:@"MenuItem" owner:nil options:nil] objectAtIndex:0];
    item.itemLabel.text = model.itemTitle;
    item.iconImageView.image = [UIImage imageNamed:model.iconName];    
    return item;
}

@end
