//
//  CLWBaseModel.h
//  CleverParents
//
//  Created by Candy on 2017/10/26.
//  Copyright © 2017年 com.zhiweism. All rights reserved.
//
//  这边可以放一些其它实体都公有的属性，及LKDBHelper数据库的地址；
//  其中PrintSQL是对NSObject的扩展，可以查看创建表的sql语句

#import <Foundation/Foundation.h>
#import <LKDBHelper/LKDBHelper.h>

@interface CLWBaseModel : NSObject

@end


// 这个NSOBJECT的扩展类
@interface NSObject(PrintSQL)

// 查看详细的建表sql语句
+ (NSString *)getCreateTableSQL;

@end
