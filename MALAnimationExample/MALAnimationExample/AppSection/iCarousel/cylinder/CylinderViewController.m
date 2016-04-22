//
//  CylinderViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/6.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "CylinderViewController.h"
#import <iCarousel.h>

@interface CylinderViewController ()<iCarouselDataSource,iCarouselDelegate>

@property (weak, nonatomic) IBOutlet iCarousel *icarousel;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation CylinderViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil)
    {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configueDatasource];
    [self setUpView];
    // Do any additional setup after loading the view.
}

#pragma mark - 设置视图
- (void)setUpView
{
    [self.icarousel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]]];
    self.icarousel.type = iCarouselTypeCoverFlow;
    self.icarousel.dataSource = self;
    self.icarousel.delegate = self;
}

- (void)configueDatasource
{
    for (int i = 1; i <= 5; i++)
    {
        [self.dataSource addObject:[NSString stringWithFormat:@"genstone%d",i]];
    }
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.dataSource.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIImageView *imageView;
    if (view == nil)
    {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 240, 300)];
    }
    else
    {
        imageView = (UIImageView *)view;
    }
    UIImage *image = [UIImage imageNamed:self.dataSource[index]];
    imageView.image = image;
    return imageView;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    NSLog(@"%.2f",offset);
    //CATransform3D transform3d;
    return CATransform3DTranslate(transform, offset * self.icarousel.itemWidth / 3, 0, offset * self.icarousel.itemWidth / 4);
}

//- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
//{
//    //customize carousel display
//    switch (option)
//    {
//        case iCarouselOptionWrap:
//        {
//            //normally you would hard-code this to YES or NO
//            return self.wrap;
//        }
//        case iCarouselOptionSpacing:
//        {
//            //add a bit of spacing between the item views
//            return value * 1.05f;
//        }
//        case iCarouselOptionFadeMax:
//        {
//            if (self.icarousel.type == iCarouselTypeCustom)
//            {
//                //set opacity based on distance from camera
//                return 0.0f;
//            }
//            return value;
//        }
//        case iCarouselOptionShowBackfaces:
//        case iCarouselOptionRadius:
//        case iCarouselOptionAngle:
//        case iCarouselOptionArc:
//        case iCarouselOptionTilt:
//        case iCarouselOptionCount:
//        case iCarouselOptionFadeMin:
//        case iCarouselOptionFadeMinAlpha:
//        case iCarouselOptionFadeRange:
//        case iCarouselOptionOffsetMultiplier:
//        case iCarouselOptionVisibleItems:
//        {
//            return value;
//        }
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
