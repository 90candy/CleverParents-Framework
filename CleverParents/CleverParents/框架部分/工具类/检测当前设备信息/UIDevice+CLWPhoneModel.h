//
//  UIDevice+CLWPhoneModel.h
//  clever
//
//  Created by Candy on 2017/9/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const Device_Simulator;
extern NSString * const Device_iPod1;
extern NSString * const Device_iPod2;
extern NSString * const Device_iPod3;
extern NSString * const Device_iPod4;
extern NSString * const Device_iPod5;
extern NSString * const Device_iPad2;
extern NSString * const Device_iPad3;
extern NSString * const Device_iPad4;
extern NSString * const Device_iPhone4;
extern NSString * const Device_iPhone4S;
extern NSString * const Device_iPhone5;
extern NSString * const Device_iPhone5S;
extern NSString * const Device_iPhone5C;
extern NSString * const Device_iPadMini1;
extern NSString * const Device_iPadMini2;
extern NSString * const Device_iPadMini3;
extern NSString * const Device_iPadAir1;
extern NSString * const Device_iPadAir2;
extern NSString * const Device_iPhone6;
extern NSString * const Device_iPhone6plus;
extern NSString * const Device_iPhone6S;
extern NSString * const Device_iPhone6Splus;
extern NSString * const Device_iPhoneSE;
extern NSString * const Device_iPhone7;
extern NSString * const Device_iPhone7plus;
extern NSString * const Device_iPhone8;
extern NSString * const Device_iPhone8plus;
extern NSString * const Device_iPhoneX;
extern NSString * const Device_Unrecognized;

/**
 *  获取手机型号的 类目
 */

@interface UIDevice (CLWPhoneModel)

/**
 *  获取当前手机的具体型号
 *
 *  @return 手机型号字符串
 */
+ (NSString *)phoneModel NS_AVAILABLE_IOS(7_0);
@end


