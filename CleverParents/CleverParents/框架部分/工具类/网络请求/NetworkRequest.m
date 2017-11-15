//
//  NetworkRequest.m
//  项目框架 - by Candy
//
//  Created by Candy on 17/1/5.
//  Copyright © 2017年 Candy. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest

#pragma mark -- 普通POST网络请求
//GET请求
+ (void)startGetRequest:(NSString *)urlString Parameters:(NSDictionary *)parameters DataKey:(NSString *)dataKey CompletionHandler:(RequestCompletion)comletionHandler {
    
}
//POST请求
+ (void)startPostRequest:(NSString *)urlString Parameters:(NSDictionary *)parameters DataKey:(NSString *)dataKey CompletionHandler:(RequestCompletion)comletionHandler {
    AFHTTPSessionManager *manager = [self sessionManager];
    [manager POST:[NSString stringWithFormat:@"%@%@",SEVER_URL,urlString] parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handlerResponse:responseObject error:nil DataKey:dataKey CompletionHandler:comletionHandler];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handlerResponse:nil error:error DataKey:dataKey CompletionHandler:comletionHandler];
    }];
}

#pragma mark -- 单文件上传(如头像上传)

+ (void)startUploadRequest:(NSString *)urlString ImageUrl:(NSString *)imageUrl Parameters:(NSDictionary *)parameters DataKey:(NSString *)dataKey CompletionHandler:(RequestCompletion)completionHandler {
    AFHTTPSessionManager *manager = [self sessionManager];
    [manager POST:[NSString stringWithFormat:@"%@%@",SEVER_URL,urlString] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        //如果图片不需要压缩：
        //NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        
        //如果图片需要压缩处理：
        NSData *imageData = [self imageCompression:imageUrl];
        
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:@"image.jpg"
                                mimeType:@"image/jpg"];
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handlerResponse:responseObject error:nil DataKey:dataKey CompletionHandler:completionHandler];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handlerResponse:nil error:error DataKey:dataKey CompletionHandler:completionHandler];
        
    }];
}

#pragma mark -- Private(私有方法)

+ (AFHTTPSessionManager * )sessionManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/html",@"text/javascript", nil];
    manager.requestSerializer.timeoutInterval = 15.0;
    return manager;
}

//处理请求
+ (void)handlerResponse:(id)responseObject error:(NSError *)error DataKey:(NSString *)dataKey CompletionHandler:(RequestCompletion)comletionHandler{
    Response * response = [[Response alloc] init];
    if (error) {
        //请求失败 - 网络问题
        response.resultDesc = error.localizedDescription;
        if (error.code == NSURLErrorNotConnectedToInternet) {
            response.resultDesc = @"无网络连接";
        } else if (error.code == NSURLErrorTimedOut){
            response.resultDesc = @"网络连接超时";
        }
    } else{
        //请求成功 - 网络没问题
        //开始验证服务器返回的请求状态
        NSInteger resultCode = [responseObject[@"statusCode"] integerValue];
        //resultCode的值由服务端返回的值进行判断 (此处0为请求成功， 其他值请求失败（-1为token验证失败）)
        if (resultCode == 0) {
            response.success = YES;
            response.resultVaule = responseObject[dataKey];
            response.resultDesc = responseObject[@"msg"];
        }else{
            NSString * message = responseObject[@"msg"];
            if (message) {
                response.resultDesc = message;
            }else{
                response.resultDesc = @"网络请求失败";
            }
        }
        if (resultCode == -1) {
            NSString * message = responseObject[@"msg"];
            if (message) {
                response.resultDesc = message;
            } else {
                response.resultDesc = @"token验证失败";
            }
        }
    }
    if (comletionHandler) {
        comletionHandler(response);
    }
}

// 图片压缩处理
+ (NSData *)imageCompression:(NSString *)imageUrl {
    //图片压缩比例
    CGFloat compressRatio = 1.0;
    //限制上传的大小(kb)
    CGFloat needSize = 200.0;
    //读取图片
    UIImage *avatarImage = [UIImage imageWithContentsOfFile:imageUrl];
    NSData *imageData = UIImageJPEGRepresentation(avatarImage,compressRatio);
    //计算图片大小(kb)
    CGFloat length = [imageData length] / 1000;
    Log(@"原图片大小 - %fkb", length);
    int num = 0;
    //当图片大于200Kb时进行图片压缩
    while (length > needSize) {
        //缩小比例(数字越是无限接近1时越精确，但是计算量会更大，0.8左右就行了)
        compressRatio *= 0.9;
        imageData = UIImageJPEGRepresentation(avatarImage,compressRatio);
        length = [imageData length] / 1000;
        num ++;
    }
    Log(@"循环次数 - %d", num);
    imageData = UIImageJPEGRepresentation(avatarImage,compressRatio);
    length = [imageData length] / 1000;
    Log(@"实际上传图片大小 - %fkb", length);
    return imageData;
}



@end
