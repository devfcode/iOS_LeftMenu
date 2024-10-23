//
//  StudyViewController.m
//  ObjectiveC
//
//  Created by William on 2018/10/22.
//  Copyright © 2018年 William. All rights reserved.
//

#import "SystemViewController.h"
#import "AppDelegate.h"


@interface SystemViewController ()

@end

@implementation SystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title = @"App";
    
    UIButton *navBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    [navBtn setTitle:@"更多" forState:UIControlStateNormal];
    [navBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [navBtn addTarget:self action:@selector(didNavBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:navBtn];
    
    NSString *aName = @"app_name";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMsg:) name:aName object:nil];
}

-(void)receiveMsg:(NSNotification *)noti {
    NSDictionary *info = [noti userInfo];
    NSString *app_name = [info objectForKey:@"app_name"];
    self.navigationItem.title = app_name;
}

- (void)didNavBtnClick{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

@end
