//
//  RootViewController.m
//  lechouchou
//
//  Created by 李 雷川 on 14-6-14.
//  Copyright (c) 2014年 李 雷川. All rights reserved.
//

#import "RootViewController.h"
#import "BannerAreaView.h"
#import "LotteryAreaView.h"
#import "TaskAreaView.h"
@interface RootViewController (){
     UIScrollView *scrollView;
     BannerAreaView   *bannderView;
     LotteryAreaView  *lotteryAreaView;
     TaskAreaView       *TaskAreaView;
    
}
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) LotteryAreaView  *lotteryAreaView;
@property(nonatomic,strong) BannerAreaView   *bannderView;
@property(nonatomic,strong) TaskAreaView     *taskAreaView;
@end

@implementation RootViewController
@synthesize scrollView,lotteryAreaView,bannderView,taskAreaView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"乐抽抽";
    
    
    UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    // Add your action to your button
    [customButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    // Customize your button as you want, with an image if you have a pictogram to display for example
    [customButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    self.navigationItem.leftBarButtonItem= menuItem;
    
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];

    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    
    NSArray *actionButtonItems = @[shareItem, cameraItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
    //self.navigationController.navigationBar.translucent = NO;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    
    //self.view.backgroundColor = [UIColor redColor];
    [self setupScrollView];
    [self setupBannerAreaView];
    [self setupLotteryAreaView];
    [self setupTaskAreaView];
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame),CGRectGetMaxY(taskAreaView.frame));
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupScrollView{
    if (!scrollView) {
        scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        scrollView.backgroundColor= [UIColor redColor];
        [self.view addSubview:scrollView];
    }
}

-(void)setupBannerAreaView{
    if (!bannderView) {
        CGRect frame = CGRectMake(0, 0, CGRectGetWidth(scrollView.bounds),88);
        bannderView = [[BannerAreaView alloc]initWithFrame:frame];
        [scrollView addSubview:bannderView];
    }
}

-(void)setupLotteryAreaView{
    if (!lotteryAreaView) {
        CGRect frame = CGRectMake(0,CGRectGetMaxY(bannderView.frame), CGRectGetWidth(scrollView.bounds),300);
        lotteryAreaView = [[LotteryAreaView alloc]initWithFrame:frame];
        [scrollView addSubview:lotteryAreaView];
    }
}

-(void)setupTaskAreaView{
    if (!taskAreaView) {
        CGRect frame = CGRectMake(0,CGRectGetMaxY(lotteryAreaView.frame), CGRectGetWidth(scrollView.bounds),500);
        taskAreaView = [[TaskAreaView alloc]initWithFrame:frame];
        [scrollView addSubview:taskAreaView];
    }
}


-(void)showMenu:(id)sender{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
