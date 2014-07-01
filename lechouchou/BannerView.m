//
//  BannerView.m
//  lechouchou
//
//  Created by 李 雷川 on 14-6-14.
//  Copyright (c) 2014年 李 雷川. All rights reserved.
//

#import "BannerView.h"
#import "Banner.h"
static float lotteryImageWidth = 64;
static float lotteryImageHeight = 64;
@interface BannerView()<UIWebViewDelegate>{
    UIImageView  *_imageView;
    UILabel      *_titleLabel;
    Banner       *_banner;
}


@end

@implementation BannerView
- (id)initWithFrame:(CGRect)frame banner:(Banner *)banner
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        _banner = banner;
        [self addImageView];
        [self addTitleLabel];
        [self configureSubView];
    }
    return self;
}


-(void)addImageView{
    if (!_imageView) {
        CGRect rect = CGRectMake(10, 10, lotteryImageWidth, lotteryImageHeight);
        _imageView = [[UIImageView alloc]initWithFrame:rect];
        [self addSubview:_imageView];
    }
}
-(void)addTitleLabel{
    if (!_titleLabel) {
        float height = 44;
        CGRect rect = CGRectMake(10,CGRectGetHeight(self.frame) - height,CGRectGetWidth(self.frame), height);
        _titleLabel = [[UILabel alloc]initWithFrame:rect];
        [self addSubview:_titleLabel];
    }
}

-(void)configureSubView{
    _imageView.image = [UIImage imageNamed:_banner.imagePath];
    _titleLabel.text = _banner.name;
}

@end
