//
//  ViewController.m
//  HggLocalNotification
//
//  Created by 胡高广 on 2017/8/24.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
#import "TwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//将要进来
- (void)viewWillAppear:(BOOL)animated
{
     [self createNotification];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    

    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark -- 点击事件
- (void)btn
{
    //第一种
//    TwoViewController *twoVC = [[TwoViewController alloc] init];
//    [self presentViewController:twoVC animated:YES completion:nil];
    //第二种
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:twoVC animated:YES];
}
#pragma mark -- 本地推送
- (void)createNotification
{
    // 使用 UNUserNotificationCenter 来管理通知
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    
    //需创建一个包含待通知内容的 UNMutableNotificationContent 对象，注意不是 UNNotificationContent ,此对象为不可变对象。
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:@"标题" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"副标题(多用于内容)" arguments:nil];
    //声音文件
    content.sound = [UNNotificationSound soundNamed:@"sound.caf"];
    
    // 在 alertTime 后推送本地推送
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                                                  triggerWithTimeInterval:0.5 repeats:NO];
    
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                                                                          content:content trigger:trigger];
    
    //添加推送成功后的处理！
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"本地通知" message:@"成功添加推送" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        [alert addAction:cancelAction];
//        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
