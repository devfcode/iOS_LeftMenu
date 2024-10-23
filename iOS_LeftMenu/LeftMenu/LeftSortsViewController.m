//
//  LeftSortsViewController.m
//  LGDeckViewController
//
//  Created by jamie on 15/3/31.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "OtherViewController.h"

@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    NSArray *applist = @[@"WeChat",@"Line",@"WhatsApp",@"Tiktok",@"Telegram"];
    self.dataArray = [[NSMutableArray alloc] initWithArray:applist];
    
    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.rowHeight = 60;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.scrollEnabled = NO;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectionStyle = NO;
    
    NSString *app_name = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = app_name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *app_name = [self.dataArray objectAtIndex:indexPath.row];
    NSLog(@"app_name:%@",app_name);
    NSString *aName = @"app_name";
    NSMutableDictionary *aUserInfo = [NSMutableDictionary dictionary];
    [aUserInfo setObject:app_name forKey:@"app_name"];
    // 推送消息
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:self userInfo:aUserInfo];
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    
    // 跳转界面
    //    OtherViewController *vc = [[OtherViewController alloc] init];
    //    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kScreenWidth == 414 ? 200 : kScreenWidth == 375 ? 180:140;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, kScreenWidth == 414 ? 200 : kScreenWidth == 375 ? 180:150)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(45, 50, 45, 45)];
    imageView.backgroundColor = [UIColor redColor];
    [view addSubview:imageView];
    UILabel *mLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 111, 200, 16)];
    mLab.centerX = imageView.centerX;
    mLab.font = [UIFont systemFontOfSize:16];
    mLab.textColor = [UIColor whiteColor];
    mLab.textAlignment = NSTextAlignmentCenter;
    mLab.text = @"应用列表";
    [view addSubview:mLab];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 150)];
//    UIButton *logoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 110, 130, 16)];
//    logoutBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//    [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
//    [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [logoutBtn setFont:[UIFont systemFontOfSize:16]];
//    [view addSubview:logoutBtn];
//    return view;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 150;
}

@end
