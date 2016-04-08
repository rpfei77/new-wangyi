//
//  HMNews.m
//  new－wangyi
//
//  Created by 大米 on 16/4/7.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMNews.h"
#import "HMNetworkTool.h"


@implementation HMNews


+ (instancetype)newsWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+ (void)newsWithSuccess:(void(^)(NSArray *news))success error:(void(^)(NSError *error))error{
    
    
    NSAssert(success != nil, @"必须传入值");
    
    [[HMNetworkTool shareNetWorkTools] GET:@"article/headline/T1348647853363/0-140.html" parameters:nil progress:nil
    success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
    
        NSMutableArray *newsList = [NSMutableArray array];
        
        NSString *rootkey = responseObject.keyEnumerator.nextObject;
        
        NSArray *headline = responseObject[rootkey];
        
        [headline enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HMNews *news = [HMNews newsWithDict:obj];
            //添加到数组中
            [newsList addObject:news];
            
        }];
        
        success(newsList.copy);
        
       // NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error=%@",error);
    }];
    
    
    
    
    
    
    
    
    
}



@end
