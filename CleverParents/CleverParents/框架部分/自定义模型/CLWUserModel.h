//
//  CLWUserModel.h
//  CleverParents
//
//  Created by Candy on 2017/10/26.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//

#import "CLWBaseModel.h"

@interface CLWUserModel : CLWBaseModel

@property(nonatomic, assign)int userID;
@property(nonatomic, strong)NSString *username;
@property(nonatomic, strong)NSString *nickname;
@property(nonatomic, strong)NSString *password;
@property(nonatomic, strong)NSString *phone;
@property(nonatomic, strong)NSString *avatarUrl;



+ (instancetype)shareUserModel;
+ (void)resetUserModel;

@end
