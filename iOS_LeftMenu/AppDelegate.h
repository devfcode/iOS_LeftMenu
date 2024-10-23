//
//  AppDelegate.h
//  iOS_LeftMenu
//
//  Created by zd on 22/10/2024.
//

#import <UIKit/UIKit.h>
#import "MyTabBarController.h"
#import "LeftSortsViewController.h"
#import "LeftSlideViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

@property (nonatomic, strong) MyTabBarController *rootTabBarController;
@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) UINavigationController *mainNavigationController;

@end

