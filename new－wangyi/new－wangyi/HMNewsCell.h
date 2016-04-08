//
//  HMNewsCell.h
//  new－wangyi
//
//  Created by 大米 on 16/4/8.
//  Copyright © 2016年 大米. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMNews;

@interface HMNewsCell : UITableViewCell

@property (nonatomic, copy) HMNews *news;

//返回cell对应的重用标示
+ (NSString *)CellIdentifier:(HMNews *)news;

//根据模型返回cell高度
+ (CGFloat)cellHeight:(HMNews *)news;


@end
