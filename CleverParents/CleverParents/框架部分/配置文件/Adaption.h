//
//  Adaption.h
//  项目框架 - by Candy
//
//  Created by Candy on 17/1/5.
//  Copyright © 2017年 Candy. All rights reserved.
//  屏幕适配文件

#ifndef Adaption_h
#define Adaption_h

#import <UIKit/UIKit.h>

#pragma 尺寸

#define TABLE_BAR_HEIGHT    49.0     //标签控制器自定义高度
#define NAV_HEIGHT          64.0     //导航栏高度

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define SCREEN_ORIGIN       [UIScreen mainScreen].bounds.origin

#pragma 参照尺寸 - iPhone5

#define BaseWidth           320.0
#define BaseHeight          568.0

#define CRM(_X,_Y,_W,_H)    CGRectMake(_X, _Y, _W, _H)
#define SCREEN_Ratio        0.658
#define FontSize(font)      [UIScreen mainScreen].bounds.size.width >=375?font+2:font
#define SCROLLERVIEW_HEIGHT CGRectGetHeight(self.view.bounds)/3

#define Inline static inline

//适配比例
Inline CGFloat AAdaptionWidth() {
    return SCREEN_WIDTH / BaseWidth;
}

//尺寸适配 
Inline CGFloat AAdaption(CGFloat x) {
    return x * AAdaptionWidth();
}

//字体适配
Inline UIFont * AAFont(CGFloat font){
    return [UIFont systemFontOfSize:font*AAdaptionWidth()];
}


Inline CGSize AAdaptionSize(CGFloat width, CGFloat height) {
    CGFloat newWidth = width * AAdaptionWidth();
    CGFloat newHeight = height * AAdaptionWidth();
    return CGSizeMake(newWidth, newHeight);
}

Inline CGPoint AAadaptionPoint(CGFloat x, CGFloat y) {
    CGFloat newX = x * AAdaptionWidth();
    CGFloat newY = y * AAdaptionWidth();
    return  CGPointMake(newX, newY);
}

Inline CGRect AAdaptionRect(CGFloat x, CGFloat y, CGFloat width, CGFloat height){
    CGFloat newX = x*AAdaptionWidth();
    CGFloat newY = y*AAdaptionWidth();
    CGFloat newW = width*AAdaptionWidth();
    CGFloat newH = height*AAdaptionWidth();
    return CGRectMake(newX, newY, newW, newH);
}

Inline CGRect AAdaptionRectFromFrame(CGRect frame){
    CGFloat newX = frame.origin.x*AAdaptionWidth();
    CGFloat newY = frame.origin.y*AAdaptionWidth();
    CGFloat newW = frame.size.width*AAdaptionWidth();
    CGFloat newH = frame.size.height*AAdaptionWidth();
    return CGRectMake(newX, newY, newW, newH);
}

#endif /* Adaption_h */
