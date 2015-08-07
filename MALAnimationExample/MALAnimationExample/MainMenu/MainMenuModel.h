//
//  MainMenuModel.h
//  MALAnimationExample
//
//  Created by wangtian on 15/5/26.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainMenuModel : NSObject

typedef enum
{
    push,
    present
    
}TransationType;

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isFromSB;
@property (nonatomic, copy) NSString *stroryBoardName;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, assign) TransationType type;

- (MainMenuModel *)initWithClassName:(NSString *)className andTitle:(NSString *)title;

@end
