//
//  SelectorViewController.m
//  MALAnimationExample
//
//  Created by wangtian on 15/8/6.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "SelectorViewController.h"
#import <SOZOChromoplast.h>
#import "UIImage+MALImage.h"
#import "UIViewController+MALNavigation.h"

@interface SelectorViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, assign) NSInteger nowIndex;
@property (nonatomic, strong) SOZOChromoplast *chromoplast;
@property (weak, nonatomic) IBOutlet UIButton *plusBtn;
@property (weak, nonatomic) IBOutlet UIButton *minusBtn;

@end

@implementation SelectorViewController

- (NSMutableArray *)imageArray
{
    if (_imageArray == nil)
    {
        _imageArray = [[NSMutableArray alloc] init];
    }
    return _imageArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configueDataSource];
    [self setImage];
    // Do any additional setup after loading the view.
}

#pragma mark - 配置imageArray
- (void)configueDataSource
{
    self.nowIndex = 0;
    for (int i = 1; i <= 16; i++)
    {
        [self.imageArray addObject:[NSString stringWithFormat:@"selector%02d",i]];
    }
}

- (void)setImage
{
    if (self.nowIndex < 0)
    {
        self.nowIndex = self.imageArray.count - 1;
    }
    if (self.nowIndex > self.imageArray.count - 1)
    {
        self.nowIndex = 0;
    }
    self.topImageView.image = [UIImage imageWithName:self.imageArray[self.nowIndex]];
    [self changeColor];
}

- (IBAction)btnClick:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            self.nowIndex++;
            break;
        }
        case 2:
        {
            self.nowIndex--;
            break;
        }
        default:
            break;
    }
    [self setImage];
}

- (void)changeColor
{
    self.chromoplast = [[SOZOChromoplast alloc] initWithImage:self.topImageView.image];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.view.backgroundColor = self.chromoplast.dominantColor;
        
    } completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
