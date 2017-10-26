//
//  CLWHomeViewController.m
//  CleverParents
//
//  Created by Candy on 2017/8/21.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//

#import "CLWHomeViewController.h"

#import "CLWDetailsViewController.h"

@interface CLWHomeViewController ()

@end

@implementation CLWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, AAdaption(200), AAdaption(50));
    btn.center = self.view.center;
    [btn setTitle:CleverLocaled(@"details.detail1", CleverLocalizable, @"详情界面") forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [self.view addSubview:self.curtainImg];

}


- (void)pushNext {
    [self.navigationController pushViewController:[CLWDetailsViewController new] animated:YES];
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
