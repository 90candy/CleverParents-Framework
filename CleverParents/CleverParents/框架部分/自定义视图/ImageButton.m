//
//  ImageButton.m
//  clever
//
//  Created by Candy on 2017/4/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ImageButton.h"

@interface ImageButton ()

//传入定位
@property(nonatomic, assign) CGRect titleRect;
@property(nonatomic, assign) CGRect imageRect;

@end

@implementation ImageButton

- (instancetype)initWithTitleRect:(CGRect)titleRect ImageRect:(CGRect)imageRect
{
    self = [super init];
    if (self) {
        self.titleRect = titleRect;
        self.imageRect = imageRect;
    }
    return self;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return self.titleRect;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return self.imageRect;
}

@end
