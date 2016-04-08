//
//  HMChannelLable.m
//  new－wangyi
//
//  Created by 大米 on 16/4/8.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMChannelLable.h"
#import "HMNewsChannel.h"

@implementation HMChannelLable

//选中显示的字体
#define HMBigLable [UIFont systemFontOfSize:18]
//默认选中的字体
#define HMSmallLable [UIFont systemFontOfSize:14]

+ (instancetype)lableWithTitle:(NSString *)title{
    
    //创建标签
    HMChannelLable *lable = [[HMChannelLable alloc]init];
    //设置标题
    lable.text = title;
    //设置大字体
    lable.font = HMBigLable;
    
    //自适应
    [lable sizeToFit];
    //设置小字体
    lable.font = HMSmallLable;
    
    
    return lable;
}

@end
