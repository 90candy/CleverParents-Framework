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

    // 操作数据库
    [self operationDatabase];
}


- (void)pushNext {
    [self.navigationController pushViewController:[CLWDetailsViewController new] animated:YES];
}

// 操作数据库
- (void)operationDatabase {
    
    LKDBHelper *globalHelper = [LKDBHelper getUsingLKDBHelper];
   
    //删除所有的表
    [globalHelper dropAllTable];
    //清理该表内所有数据
    [LKDBHelper clearTableData:[CLWUserModel class]];

    CLWUserModel *user = [[CLWUserModel alloc] init];
    user.username = @"17608041381";
    user.password = @"123456";
    user.nickname = @"Candy";
    user.phone = @"17608041381";
    user.avatarUrl = @"http://upload-images.jianshu.io/upload_images/2822163-11c0bc3cb674ba9e.png?";
    
    //插入数据 如果表不存在 它会自动创建再插入 实体实例化LKDBHelper 若是继承记得引用 否则会没有效果
    if ([user saveToDB]) {
        NSLog(@"数据插入成功");
    }
    //获取创建表的sql语句
    [CLWUserModel getCreateTableSQL];
    
    //查询
    NSArray *modelArr = [CLWUserModel searchWithWhere:@"username='17608041381'" orderBy:nil offset:0 count:100];
    for (CLWUserModel *userModel in modelArr) {
        NSLog(@"\n数据库查询结果：\n userID = %d\n username = %@\n password = %@\n nickname = %@\n phone = %@\n avatarUrl = %@",
              userModel.userID, userModel.username, userModel.password, userModel.nickname, userModel.phone, userModel.avatarUrl);
    }
    
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
