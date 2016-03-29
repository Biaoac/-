//
//  ViewController.m
//  本地推送
//
//  Created by Treney on 16/3/27.
//  Copyright © 2016年 Treney. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/**
 *  点击按钮后添加本地通知
 */
- (IBAction)addLocalNote;
/**
 *  移除通知(不常用)
 */
- (IBAction)removeLocalNote;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 *  点击按钮后添加本地通知
 */
- (IBAction)addLocalNote {
    
    /*
     @property(nonatomic,copy) NSDate *fireDate;
     @property(nonatomic,copy) NSTimeZone *timeZone;
     @property(nonatomic) NSCalendarUnit repeatInterval;
     @property(nonatomic,copy) NSCalendar *repeatCalendar;
     @property(nonatomic,copy) CLRegion *region NS_AVAILABLE_IOS(8_0);
     @property(nonatomic,assign) BOOL regionTriggersOnce NS_AVAILABLE_IOS(8_0);
     @property(nonatomic,copy) NSString *alertBody;
     @property(nonatomic) BOOL hasAction;
     @property(nonatomic,copy) NSString *alertAction;
     @property(nonatomic,copy) NSString *alertLaunchImage;
     @property(nonatomic,copy) NSString *soundName;      UILocalNotificationDefaultSoundName
     @property(nonatomic) NSInteger applicationIconBadgeNumber;
     
     @property(nonatomic,copy) NSDictionary *userInfo;
     */
    // 1.创建一个本地通知
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    // 1.1.设置通知发出的时间
    localNote.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    // 1.2.设置通知发出的内容
    localNote.alertBody = @"我是一条推送消息";
    // 1.3.是否弹出提示框
    localNote.hasAction = YES;
    // 1.4.设置提示框
    localNote.alertAction = @"赶紧查看";
    // 1.5.设置启动的图片
    localNote.alertLaunchImage = @"backk.jpg";
    // 1.6.设置启动的音效
    localNote.soundName = UILocalNotificationDefaultSoundName;
    // 1.7.设置应用图标提醒的数字
    localNote.applicationIconBadgeNumber = 666;
    
    // 1.8.如果想将通知的信息传递过去,必须使用userInfo属性
    localNote.userInfo = @{@"msg" : @"吃饭了吗", @"date" : localNote.fireDate};
    // 2.调度通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    
    

    
}

- (IBAction)removeLocalNote {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    //    [UIApplication sharedApplication] cancelLocalNotification:(UILocalNotification *)
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
