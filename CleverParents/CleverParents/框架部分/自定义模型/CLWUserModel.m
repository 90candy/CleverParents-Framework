//
//  CLWUserModel.m
//  CleverParents
//
//  Created by Candy on 2017/10/26.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//
static dispatch_once_t onceToken;
static CLWUserModel * userModel = nil;

#import "CLWUserModel.h"

@implementation CLWUserModel

+ (instancetype)shareUserModel {

    dispatch_once(&onceToken, ^{
        userModel = [[CLWUserModel alloc] init];
    });
    return userModel;
}

//重置单例
+ (void)resetUserModel {
    onceToken = 0;
    userModel = nil;
}

// 用于数据库建表时的初始化方法
+ (void)initialize {
    [self removePropertyWithColumnName:@"error"];
}

/**
 *  @brief  是否将父实体类的属性也映射到sqlite库表
 *  @return BOOL
 */
+ (BOOL) isContainParent {
    return YES;
}
/**
 *  @brief  设定表名
 *  @return 返回表名
 */
+ (NSString *)getTableName {
    return @"userBean";
}
/**
 *  @brief  设定表的单个主键
 *  @return 返回主键表
 */
+ (NSString *)getPrimaryKey {
    return @"userID";
}
@end
