//
//  HMNewsChannel.h
//  new－wangyi
//
//  Created by 大米 on 16/4/8.
//  Copyright © 2016年 大米. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNewsChannel : NSObject


@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *cid;

+ (instancetype)channelWithDict:(NSDictionary *)dict;


+ (NSArray *)channels;


@end
