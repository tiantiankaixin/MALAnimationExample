//
//  FromViewController.h
//  MALAnimationExample
//
//  Created by wangtian on 15/7/30.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PushCollectionViewCell.h"

@interface FromViewController : UIViewController

@property (nonatomic, strong) NSIndexPath *selectIndexPath;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
