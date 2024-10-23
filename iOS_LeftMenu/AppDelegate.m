//
//  AppDelegate.m
//  iOS_LeftMenu
//
//  Created by zd on 22/10/2024.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.rootTabBarController = [[MyTabBarController alloc] init];
    self.mainNavigationController = [[UINavigationController alloc]initWithRootViewController:self.rootTabBarController];
    self.mainNavigationController.navigationBar.hidden = YES;
    
    LeftSortsViewController *leftVC = [[LeftSortsViewController alloc] init];
    self.LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:self.mainNavigationController];
    self.window.rootViewController = self.LeftSlideVC;
    
    return YES;
}

@end
