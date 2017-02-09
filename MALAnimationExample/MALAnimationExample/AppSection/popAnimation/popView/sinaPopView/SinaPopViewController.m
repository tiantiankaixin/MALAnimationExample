//
//  SinaPopViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/4.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "SinaPopViewController.h"
#import <GPUImage.h>
#import "UIView+MALFunction.h"
#import "MALImage.h"
#import "UIImage+MALImage.h"

#define OnePageItemCount 6
#define ItemMarginWithBottom 120 //下层item距离屏幕边界距离

#define ItemWidth 71
#define ItemHeight 91
#define MenuHeight 271

#define ItemSZMargin 20

#define SinaPopAnimationTime 0.5

@interface SinaPopViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeBtnConstraint;
@property (strong, nonatomic) GPUImageView *gpuImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backConstraint;
@property (nonatomic, strong) NSMutableArray *dataSource;//里面存的是每一页的数组
@property (nonatomic, strong) NSMutableArray *allItemsArray;//所有item的数据
@property (nonatomic, strong) NSMutableArray *allPageItemArray;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (nonatomic, assign) CGFloat needMoveY;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (nonatomic, assign) NSInteger nowPage;//当前页
@property (nonatomic, strong) GPUImageiOSBlurFilter *filter;

@end

@implementation SinaPopViewController

#pragma mark - getter
//滤镜
- (GPUImageiOSBlurFilter *)filter
{
    if (_filter == nil)
    {
        _filter = [[GPUImageiOSBlurFilter alloc] init];
        _filter.blurRadiusInPixels = 4.0f;
    }
    return  _filter;
}

- (GPUImageView *)gpuImageView
{
    if (_gpuImageView == nil)
    {
        _gpuImageView = [[GPUImageView alloc] initWithFrame:KEYWINDOW.bounds];
    }
    return _gpuImageView;
}

- (NSMutableArray *)allPageItemArray
{
    if (_allPageItemArray == nil)
    {
        _allPageItemArray = [NSMutableArray array];
    }
    return _allPageItemArray;
}

- (NSMutableArray *)allItemsArray
{
    if (_allItemsArray == nil)
    {
        _allItemsArray = [[NSMutableArray alloc] init];
    }
    return _allItemsArray;
}

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil)
    {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - 设置视图
- (void)setUpView
{
    [self.view setViewSize:IOS_SCREEN.size];
    [self.view insertSubview:self.gpuImageView belowSubview:self.backBtn];
    [self setUpFilter];
}

- (void)setUpFilter
{
    self.gpuImageView.clipsToBounds = YES;
    //而contentsGravity确保图片出现在image view的顶部
    self.gpuImageView.layer.contentsGravity = kCAGravityTop;
    UIImage *image = [self.blurView imageFromView];
    GPUImagePicture *picture = [[GPUImagePicture alloc] initWithImage:image];
    [picture addTarget:self.filter];
    [self.filter addTarget:self.gpuImageView];
    [picture processImage];
}

- (void)configueWithTitleArray:(NSMutableArray *)titleArray imageArray:(NSMutableArray *)imageArray
{
    _itemCount = titleArray.count;
    self.nowPage = 0;
    [self configuePageCount];
    [self configueDataSourceWithTitleArray:titleArray imageArray:imageArray];
    [self setUpMenuItem];
    [self initItemPosition];
}

- (void)configuePageCount
{
    _pageCount = _itemCount / OnePageItemCount;
    if (_itemCount % OnePageItemCount != 0)
    {
        _pageCount++;
    }
}

- (void)configueDataSourceWithTitleArray:(NSMutableArray *)titleArray imageArray:(NSMutableArray *)imageArray
{
    for (NSInteger i = 0; i < _pageCount; i++)
    {
        NSInteger insertIndex = i * 6 + 5;
        if (_itemCount - insertIndex > 1)
        {
            [titleArray insertObject:@"更多" atIndex:insertIndex];
            [imageArray insertObject:@"tabbar_compose_more" atIndex:insertIndex];
            _itemCount++;
        }
    }
    [self configuePageCount];
    for (NSInteger i = 0; i < _pageCount; i++)
    {
        NSMutableArray *onePageItems = [NSMutableArray array];
        NSInteger minIndex = i * 6;
        NSInteger maxIndex = i * 6 + 5;
        for (NSInteger j = minIndex; j <= maxIndex; j++)
        {
            if (j < _itemCount)
            {
                MenuItemModel *model = [[MenuItemModel alloc] initWithTitle:titleArray[j] iconName:imageArray[j]];
                model.idx = j;
                model.pageIdx = i;
                [onePageItems addObject:model];
                [self.allItemsArray addObject:model];
            }
        }
        [self.dataSource addObject:onePageItems];
    }
}

#pragma mark - 设置menu item
- (void)setUpMenuItem
{
    [self.dataSource enumerateObjectsUsingBlock:^(NSMutableArray *obj, NSUInteger idx, BOOL *stop) {
        
        NSMutableArray *onePageItems = [[NSMutableArray alloc] init];
        [obj enumerateObjectsUsingBlock:^(MenuItemModel *model, NSUInteger idx, BOOL *stop) {
            
            MenuItem *item = [MenuItem itemWithModel:model];
            item.tag = model.idx;
            [item addTarget:self action:@selector(menuItemClick:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.view addSubview:item];
            [onePageItems addObject:item];
        }];
        [self.allPageItemArray addObject:onePageItems];
    }];
    [self setUpMenuItemFrame];
}

#pragma mark - 设置menu item的frame
- (void)setUpMenuItemFrame
{
    CGFloat spMargin = (SCREEN_WIDTH - 3 * ItemWidth) / 4;
    CGFloat szMargin = ItemSZMargin;
    CGFloat menuHeight = 3 * ItemSZMargin + 2 * ItemHeight;
    CGFloat szAdd = SCREEN_HEIGHT - ItemMarginWithBottom - menuHeight;
    self.needMoveY = SCREEN_HEIGHT - szAdd;
    [self.allPageItemArray enumerateObjectsUsingBlock:^(NSMutableArray *obj, NSUInteger idx, BOOL *stop) {
        
        [obj enumerateObjectsUsingBlock:^(MenuItem *item, NSUInteger idx1, BOOL *stop) {
            
                NSInteger hang = idx1 / 3;
                NSInteger lie = idx1 % 3;
                CGFloat itemx = spMargin + (spMargin + ItemWidth) * lie + idx * SCREEN_WIDTH;
                CGFloat itemy = szMargin + (szMargin + ItemHeight) * hang + szAdd;
                [item setViewOrigin:CGPointMake(itemx, itemy)];
        }];
    }];
}

- (void)initItemPosition
{
    NSMutableArray *firstPageItems = self.allPageItemArray[0];
    [firstPageItems enumerateObjectsUsingBlock:^(MenuItem *obj, NSUInteger idx, BOOL *stop) {
        
        obj.transform = CGAffineTransformIdentity;
        obj.transform = CGAffineTransformMakeTranslation(0, self.needMoveY);
    }];
}

#pragma mark - item 点击事件
- (void)menuItemClick:(UIControl *)control
{
    MenuItemModel *model = self.allItemsArray[control.tag];
    if(model.isMore)
    {
        [self isMoreAnimation:YES];
    }
    else
    {
        if ([self.sinaPopDelegate respondsToSelector:@selector(menuItemClickWithModel:)])
        {
            [self.sinaPopDelegate menuItemClickWithModel:model];
        }
    }
}

#pragma mark - 返回按钮被点击
- (IBAction)backBtnClick:(id)sender
{
    [self isMoreAnimation:NO];
}

- (void)isMoreAnimation:(BOOL)isMore
{
    NSInteger changePage = -1;
    CGFloat changeX = SCREEN_WIDTH;
    CGFloat changeConstant = 0;
    if (isMore)
    {
        changePage = 1;
        changeX = -SCREEN_WIDTH;
        changeConstant = SCREEN_WIDTH / 4;
    }
    if ((self.nowPage == 0 && isMore) || (self.nowPage == 1 && isMore == NO))
    {
        self.closeBtnConstraint.constant = changeConstant;
        self.backConstraint.constant = -changeConstant;
    }
    self.backBtn.hidden = NO;
    [UIView animateWithDuration:SinaPopAnimationTime animations:^{
        
        [self.allPageItemArray enumerateObjectsUsingBlock:^(NSMutableArray *obj, NSUInteger idx, BOOL *stop) {
            
            [obj enumerateObjectsUsingBlock:^(MenuItem *item, NSUInteger idx, BOOL *stop) {
                
                [item changeViewX:changeX];
            }];
        }];
        
        if ((self.nowPage == 0 && isMore) || (self.nowPage == 1 && isMore == NO))
        {
            [self.view layoutIfNeeded];
        }
        
    } completion:^(BOOL finished) {
        
        if (finished)
        {
            if (isMore)
            {
                self.nowPage++;
            }
            else
            {
                if ( self.nowPage == 1 && isMore == NO)
                {
                    self.backBtn.hidden = YES;
                }
                self.nowPage--;
            }
        }
    }];

}

- (void)show
{
    self.closeBtn.alpha = 0;
    [KEYWINDOW addSubview:self.view];
    [self.allPageItemArray[0] enumerateObjectsUsingBlock:^(MenuItem *obj, NSUInteger idx, BOOL *stop) {
        
        [UIView animateWithDuration:SinaPopAnimationTime delay:0.05 * idx usingSpringWithDamping:8 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            obj.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            if (finished && idx == 0)
            {
                self.closeBtn.alpha = 1;
            }
        }];
    }];
}

- (IBAction)close:(UIButton *)sender
{
    NSInteger index = 0;
    NSMutableArray *firstPageItems = self.allPageItemArray[self.nowPage];
    for (NSInteger i = firstPageItems.count - 1; i >= 0; i--)
    {
        [UIView animateWithDuration:SinaPopAnimationTime delay:0.05 * index usingSpringWithDamping:8 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            MenuItem *obj = firstPageItems[i];
            obj.transform = CGAffineTransformMakeTranslation(0, self.needMoveY);
            if (i == 0)
            {
                self.view.alpha = 0.0;
            }
            
        } completion:^(BOOL finished) {
            
            if (finished && i == 0)
            {
               [self resetView];
            }
        }];
        index++;
    }
}

#pragma mark - 将popView各视图位置还原
- (void)resetView
{
    [self.view removeFromSuperview];
    self.view.alpha = 1.0;
    self.backConstraint.constant = 0;
    self.backBtn.hidden = YES;
    self.closeBtnConstraint.constant = 0;
    if (self.nowPage != 0)
    {
        [self resetNowPageItem];
        [self setUpMenuItemFrame];
    }
    [self initItemPosition];
}

- (void)resetNowPageItem
{
    NSMutableArray *nowPageItems = self.allPageItemArray[self.nowPage];
    [nowPageItems enumerateObjectsUsingBlock:^(MenuItem *obj, NSUInteger idx, BOOL *stop) {
        
        obj.transform = CGAffineTransformIdentity;
    }];
    self.nowPage = 0;
}

- (void)dealloc
{
    Log(@"dealloc");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
