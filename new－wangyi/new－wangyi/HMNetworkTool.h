//
//  HMNetworkTool.h
//  new－wangyi
//
//  Created by 大米 on 16/4/5.
//  Copyright © 2016年 大米. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMNetworkTool.h"
#import <AFNetworking.h>

@interface HMNetworkTool : AFHTTPSessionManager


///设置全局访问点
+ (instancetype)shareNetWorkTools;


@end
