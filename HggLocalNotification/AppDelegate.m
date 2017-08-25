//
//  AppDelegate.m
//  HggLocalNotification
//
//  Created by 胡高广 on 2017/8/24.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TwoViewController.h"
#import "UIApplication+GYApplication.h" //判断控制器是什么类型的
//10.0之后本地推送的方法
#import <UserNotifications/UserNotifications.h>
@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navc;
    [self.window makeKeyAndVisible];
    //处理iOS8本地推送不能收到
    
    //通知
    UNUserNotificationCenter *notificenter = [UNUserNotificationCenter currentNotificationCenter];
    //代理
    notificenter.delegate = self;
    
    //ios10 之后的注册 标题+声音
    [notificenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound)  completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"注册");
    }];
    //获取当前的通知设置，UNNotificationSettings 是只读对象，不能直接修改，只能通过以下方法获取
    [notificenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        NSLog(@"设置");
    }];
    // Override point for customization after application launch.
    return YES;
}

#pragma mark -- 本地通知代理的方法
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    NSLog(@"%@",notification);
    //前台调用通知
   completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert);
}

//点击跳转
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    NSLog(@"haha");
    TwoViewController * twovc = [[TwoViewController alloc]init];
    //UINavigationController *navi = [[UIApplication sharedApplication] visibleNavigationController];
    twovc.idStr = @"1";
//    [navi presentViewController:twovc animated:YES completion:nil];
    
    UINavigationController * Nav = [[UINavigationController alloc]initWithRootViewController:twovc];//这里加导航栏是因为我跳转的页面带导航栏，如果跳转的页面不带导航，那这句话请省去。
    [self.window.rootViewController presentViewController:Nav animated:YES completion:nil];
}

//使用 UNNotification 本地通知
//+(void)registerNotification:(NSInteger )alerTime{
//    
//    // 使用 UNUserNotificationCenter 来管理通知
//    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
//    
//    //需创建一个包含待通知内容的 UNMutableNotificationContent 对象，注意不是 UNNotificationContent ,此对象为不可变对象。
//    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
//    content.title = [NSString localizedUserNotificationStringForKey:@"Hello!" arguments:nil];
//    content.body = [NSString localizedUserNotificationStringForKey:@"Hello_message_body"
//                                                         arguments:nil];
//    content.sound = [UNNotificationSound defaultSound];
//    
//    // 在 alertTime 后推送本地推送
//    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
//                                                  triggerWithTimeInterval:alerTime repeats:NO];
//    
//    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
//                                                                          content:content trigger:trigger];
//    
//    //添加推送成功后的处理！
//    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"本地通知" message:@"成功添加推送" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        [alert addAction:cancelAction];
//        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
//    }];
//}  
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
