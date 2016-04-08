//
//  HMNewsChannel.m
//  new－wangyi
//
//  Created by 大米 on 16/4/8.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMNewsChannel.h"

@implementation HMNewsChannel



+ (instancetype)channelWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}


+ (NSArray *)channels{
    //加载数据
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil]];
    //转换字典
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
   //获得数组
    NSArray *channelArray = dict[@"tList"];
                    
    NSMutableArray *channels = [NSMutableArray array];
    
    [channelArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        HMNewsChannel *newschannel = [HMNewsChannel channelWithDict:obj];
        [channels addObject:newschannel];      
    }];
  
    //排序
    return [channels sortedArrayUsingComparator:^NSComparisonResult(HMNewsChannel  * _Nonnull obj1, HMNewsChannel * _Nonnull obj2) {
        
       return [obj1.cid compare:obj2.cid];
    }];
}







@end
