//
//  BannerAreaView.m
//  lechouchou
//
//  Created by 李 雷川 on 14-6-21.
//  Copyright (c) 2014年 李 雷川. All rights reserved.
//

#import "BannerAreaView.h"
#import "Banner.h"
#import "BannerView.h"
@interface BannerAreaView()<UIScrollViewDelegate>{
    UIScrollView   *_scrollerView;
    NSArray        *_bannerArr;
}
@end
@implementation BannerAreaView

- (id)initWithFrame:(CGRect)frame bannerys:(NSArray *)arr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        _bannerArr = arr;
    }
    return self;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

}
-(void)addBannerViews{

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
