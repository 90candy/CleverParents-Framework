//
//  CLWNavigationViewController.m
//  CleverParents
//
//  Created by Candy on 2017/8/21.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//

#import "CLWNavigationViewController.h"

@interface CLWNavigationViewController ()

@end

@implementation CLWNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航控制器主题色
    self.navigationBar.barTintColor = APP_MAIN_COLOR;
    //改变导航栏返回按钮颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    //设置导航控制器标题颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
