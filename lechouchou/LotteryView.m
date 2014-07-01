//
//  LotteryView.m
//  lechouchou
//
//  Created by 李 雷川 on 14-6-14.
//  Copyright (c) 2014年 李 雷川. All rights reserved.
//

#import "LotteryView.h"
#import "Lottery.h"
static float lotteryImageWidth = 64;
static float lotteryImageHeight = 64;
@interface LotteryView()<UIWebViewDelegate>{
    UIImageView  *_imageView;
    UILabel      *_titleLabel;
    Lottery      *_lottery;
}


@end
@implementation LotteryView
- (id)initWithFrame:(CGRect)frame lottery:(Lottery *)lottery
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _lottery = lottery;
        [self addImageView];
        [self addTitleLabel];
        [self configureSubView];
    }
    return self;
}


-(void)awakeFromNib{
    self.backgroundColor = [UIColor yellowColor];
    [self setupWebView];
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
    _imageView.image = [UIImage imageNamed:_lottery.imagePath];
    _titleLabel.text = _lottery.name;
}

-(void)setupWebView{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.bounds];
    webView.delegate = self;
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"choujiang/rolling" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self addSubview:webView];
    
}

-(void)beginLottery:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"抽奖结果" message:@"100万" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];

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
