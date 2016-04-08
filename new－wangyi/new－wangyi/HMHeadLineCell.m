//
//  HMHeadLineCell.m
//  new－wangyi
//
//  Created by 大米 on 16/4/6.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMHeadLineCell.h"
#import "HMHeadLine.h"
#import <UIImageView+WebCache.h>


@interface HMHeadLineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end


@implementation HMHeadLineCell

- (void)setHeadline:(HMHeadLine *)headline{
    
    _headline = headline;
    
   
    //图片
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:headline.imgsrc] placeholderImage:nil options: SDWebImageRetryFailed |SDWebImageLowPriority];
   
   
}







@end
