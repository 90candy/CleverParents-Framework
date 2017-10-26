//
//  CLWMineViewController.m
//  CleverParents
//
//  Created by Candy on 2017/8/21.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//

#import "CLWMineViewController.h"
#import "CLWDetailsViewController.h"


@interface CLWMineViewController () <UINavigationControllerDelegate>

@end

@implementation CLWMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    //设置代理，隐藏导航栏（保留滑动返回）
//    self.navigationController.delegate = self;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, AAdaption(200), AAdaption(50));
    btn.center = self.view.center;
    [btn setTitle:CleverLocaled(@"details.detail1", CleverLocalizable, @"详情界面") forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
 
}

#pragma mark *** action ***

- (void)pushNext {
    [self.navigationController pushViewController:[CLWDetailsViewController new] animated:YES];
}

#pragma mark *** UINavigationControllerDelegate ***
//隐藏导航栏方式各式各样
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    BOOL isHomePage = [viewController isKindOfClass:[self class]];
//
//    [self.navigationController setNavigationBarHidden:isHomePage animated:YES];
//}


@end
