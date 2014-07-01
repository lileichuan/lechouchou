//
//  LotteryAreaView.m
//  lechouchou
//
//  Created by 李 雷川 on 14-6-21.
//  Copyright (c) 2014年 李 雷川. All rights reserved.
//

#import "LotteryAreaView.h"
#import "LotteryView.h"
@interface LotteryAreaView()<UIScrollViewDelegate>{
    NSArray        *_lotteryArr;
}
@end

@implementation LotteryAreaView

- (id)initWithFrame:(CGRect)frame lotterys:(NSArray *)arr
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)addLotteryView{
    CGRect rect;
    float width = 96;
    float height = 96;
    float space = 8;
    for (NSInteger i = 0; i < _lotteryArr.count;i++) {
        NSInteger row = i % 3;
        NSInteger col = i /3;
        rect = CGRectMake((width + space) * row + space,(height + space) * col + space, width, height);
        LotteryView *lotteryView = [[LotteryView alloc]initWithFrame:rect lottery:_lotteryArr[i]];
        [self addSubview:lotteryView];
    }
}

@end
