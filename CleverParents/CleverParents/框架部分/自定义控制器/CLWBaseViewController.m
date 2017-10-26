//
//  CLWBaseViewController.m
//  CleverParents
//
//  Created by Candy on 2017/8/21.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//

#import "CLWBaseViewController.h"

@interface CLWBaseViewController ()



@end

@implementation CLWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //显示状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    //去掉navigationBar顶部线条
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    //去掉tabBar顶部线条
    [self.tabBarController.tabBar setBackgroundImage:[UIImage new]];
    self.tabBarController.tabBar.shadowImage = [UIImage new];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithTitle:NSLocalizedStringFromTable(@"btn.back", CleverLocalizable, "返回")
                                             style:UIBarButtonItemStylePlain
                                             target:self action:@selector(onBackBtn)];
    
}

#pragma mark *** action ***
- (void)onBackBtn {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark *** getter ***

- (UIImageView *)curtainImg {
    if (_curtainImg == nil) {
        _curtainImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AAdaption(5))];
        _curtainImg.image = [UIImage imageNamed:@"main_bg_top_jc"];
        _curtainImg.layer.borderWidth = 0;
        _curtainImg.layer.borderColor = APP_MAIN_COLOR.CGColor;
    }
    return _curtainImg;
}


@end
