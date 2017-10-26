//
//  SystemConfig.h
//  clever
//
//  Created by Candy on 2017/4/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#ifndef SystemConfig_h
#define SystemConfig_h

//国际化文件自定义名字
#define CleverLocalizable       @"CLWLocalization"
#define CleverLocaled(_key, CleverLocalizable, _comment)    NSLocalizedStringFromTable(_key, CleverLocalizable, _comment)

//宏定义weak
#define WeakSelf                __weak typeof(self) weakSelf = self

//宏定义RGB颜色
#define RGB_COLOR(_R,_G,_B,_A) [UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:_A]
//背景灰
#define COLOR_GRAY RGB_COLOR(240, 240, 240, 1)
//主题颜色 - 蓝色
#define COLOR_BLUE RGB_COLOR(23, 142, 212, 1)
#define APP_MAIN_COLOR RGB_COLOR(33, 167, 230, 1)

//调试版本
#if DEBUG

#define ApnsCertName            @"DevelopParentsPush"
#define Log(format, ...)        NSLog(format, ##__VA_ARGS__)

#else
//发布版本
#define Log(format, ...)
#define ApnsCertName            @"ParentsPush"

#endif

//AppID(家长版AppId)
#define APP_ID                                  @"1244974205"

//环信Key & id
#define EM_KEY                                  @"1176161226115985#cleverbeta"
//百度地图Key
#define BMK_KEY                                 @"bTRtEaeFh4RkzR7PGxysWXjUGCxo5pZc"
//微信key
#define WX_KEY                                  @"wx9b89135ce7439e67"
//支付宝Key
#define ALIPAY_KEY                              @"parentsalipay"
//QQ分享key
#define QQ_KEY                                  @"1106038053"

//0为Api类型接口请求，并且返回 statusCode = 0 时为请求成功
//1为web类型接口请求，并且返回 statusCode = 1 时为请求成功
#define TYPE_API    0
#define TYPE_WEB    1

#endif /* SystemConfig_h */
