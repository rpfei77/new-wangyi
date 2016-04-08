//
//  HMNetworkTool.m
//  new－wangyi
//
//  Created by 大米 on 16/4/5.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMNetworkTool.h"

@implementation HMNetworkTool

+ (instancetype)shareNetWorkTools{
    static HMNetworkTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //@"http://c.m.163.com/nc/article/headline/"];
        
        NSURL *baseUrl = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        //创建会话配置对象
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        //设置请求时长
        config.timeoutIntervalForRequest = 15.0;
        
        instance = [[self alloc]initWithBaseURL:baseUrl sessionConfiguration:config];
        //设置响应解析数据类型
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
        
    });
    return instance;
}


@end
