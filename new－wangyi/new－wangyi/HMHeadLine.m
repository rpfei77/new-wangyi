//
//  HMHeadLine.m
//  new－wangyi
//
//  Created by 大米 on 16/4/6.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMHeadLine.h"
#import <objc/runtime.h>
#import "HMNetworkTool.h"

@implementation HMHeadLine

+ (instancetype)HeadLineWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    NSArray *pros = [self properties];
    for (NSString *key in pros) {
        if (dict[key]) {
            [obj setValue:dict[key] forKey:key];
        }
    }
    
    return obj;
}


+ (void)HeadLineWithSuccess:(void(^)(NSArray *headLines))success error:(void(^)(NSError *error))error{
    
    [[HMNetworkTool shareNetWorkTools]GET:@"ad/headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
      
       //获得第一个key
       NSString *rootkey = responseObject.keyEnumerator.nextObject;
       //获得数组
       NSArray *headArray = responseObject[rootkey];
       //创建模型数组
       NSMutableArray *headline = [NSMutableArray array];
       //遍历数组
       [headArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           //字典转模型
           HMHeadLine *head = [HMHeadLine HeadLineWithDict:obj];
           //将模型添加到数组中
           [headline addObject:head];
       }];
        //将结果传递给调用方
       if (success) {
            success(headline.copy);
        }
      
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
        NSLog(@"error = %@",err);
        //失败回调
        if (error) {
            error(err);
        }
    }];
    
}

/*
 返回当前属性
 
 1.动态的获取某个类的方法
 2.交互两个方法的实现
 3.给分类添加属性
 */



+ (NSArray *)properties {
    
    NSMutableArray *pros = [NSMutableArray array];
    //属性的个数
    unsigned int count = 0;
    
    //获得属性的个数
    objc_property_t *property = class_copyPropertyList([self class], &count);
    for (NSInteger index = 0; index < count; index ++) {
        //根据index获得对应的属性
        objc_property_t p = property[index];
        //获得属性的名字
        const char *cname = property_getName(p);
        //转换oc字符串
        NSString *name = [[NSString alloc]initWithCString:cname encoding:NSUTF8StringEncoding];
        //将属性添加到数组中
        [pros addObject:name];
     
    }
 
    return pros;
}




@end
