//
//  HMHeadLine.h
//  new－wangyi
//
//  Created by 大米 on 16/4/6.
//  Copyright © 2016年 大米. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHeadLine : NSObject
///标题
@property (nonatomic, copy) NSString *title;
///图片
@property (nonatomic, copy) NSString *imgsrc;

+ (instancetype)HeadLineWithDict:(NSDictionary *)dict;


+ (void)HeadLineWithSuccess:(void(^)(NSArray *headLines))success error:(void(^)(NSError *error))error;

@end
