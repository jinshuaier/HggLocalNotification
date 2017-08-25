
//
//  TwoViewController.m
//  HggLocalNotification
//
//  Created by 胡高广 on 2017/8/24.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "TwoViewController.h"
// 屏幕适配时需要的宏
#define WIDHT [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface TwoViewController ()

@end

@implementation TwoViewController

//第一种
//-(void)viewWillAppear:(BOOL)animated{
//    [self viewDidAppear:YES];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//}
//第二种
-(void)viewWillAppear:(BOOL)animated{
    
    if(self.idStr) {
        //第二种方式
        [self createTwoUi];
    }
    
}

//
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"下一页";
    //第一种跳转的方式
    //[self createOneUi];
    
    
       // Do any additional setup after loading the view.
}


//第一种方式
- (void)createOneUi
{
    //创建导航栏的View
    UIView *navView = [[UIView alloc] init];
    navView.frame = CGRectMake(0, 0, WIDHT, 64);
    navView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:navView];
    //返回按钮
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    backBtn.frame = CGRectMake(0, 22, 40, 40);
    [backBtn setImage:[UIImage imageNamed:@"返回按钮"] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(backBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [navView addSubview:backBtn];
    //店铺的标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, 33, WIDHT, 18);
    titleLabel.text = @"下一页";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:titleLabel];
}

// 第二种方式
- (void)createTwoUi
{
    //左边导航栏的按钮
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    // Add your action to your button
    [leftButton addTarget:self action:@selector(barButtonItemsao:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"返回按钮"] forState:(UIControlStateNormal)];
    UIBarButtonItem *barleftBtn = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = barleftBtn;
}

- (void)barButtonItemsao:(UIButton *)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- 返回按钮
- (void)backBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
