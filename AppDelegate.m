//
//  AppDelegate.m
//  本地推送
//
//  Created by Treney on 16/3/27.
//  Copyright © 2016年 Treney. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end
/*  推送

分类
1、远程推送（Remote Notification）

2、本地推送 （Local Notification）
作用
可以让APP不在前台，告知用户 APP内部发生了什么事
效果
1、没有效果
2、在屏幕顶部 显示一块横幅（显示具体的内容）
3、在屏幕的中间弹出一个AlertController（也是显示具体内容）
4、在锁屏的时候，显示一块横幅
5、可以更改APP上面显示的提醒数字

- 播放音效
- 推送通知的使用细节
注意：发送推送通知的时候，如果APP在前台运行，那么推送的通知不会被呈现出来
     在发送通知之后，无论APP是打开，还是关闭，推送都能如期发出，但是用户 不一定能如期去接收
 
 */
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
     UIUserNotificationTypeNone    = 0,      无类型(不给用户发通知)
     UIUserNotificationTypeBadge   = 1 << 0, 是否可以改变应用图标右上角的提示数字
     UIUserNotificationTypeSound   = 1 << 1, 该通知是否会有声音
     UIUserNotificationTypeAlert   = 1 << 2, 是否有弹出提示
     */
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        // 跳转
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 300, 300, 300);
        label.backgroundColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"%@", launchOptions];
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        [self.window.rootViewController.view addSubview:label];
    }
    
    return YES;
}

/**
 *  点击通知打开应用的时候会执行该方法
 *  应用在前台的时候,收到通知也会执行该方法
 *
 *  @param notification 通知
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 300, 300);
    label.backgroundColor = [UIColor colorWithRed:0.871 green:1.000 blue:0.797 alpha:1.000];
    label.text = [NSString stringWithFormat:@"%@", notification];
    label.font = [UIFont systemFontOfSize:14];
    label.numberOfLines = 0;
    [self.window.rootViewController.view addSubview:label];
    //    if (application.applicationState == UIApplicationStateBackground) {
    //
    //    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
