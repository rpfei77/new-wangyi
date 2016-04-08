//
//  HMNews.h
//  new－wangyi
//
//  Created by 大米 on 16/4/7.
//  Copyright © 2016年 大米. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNews : NSObject

//http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html
/*
 
 "url_3w": "http://sports.163.com/16/0407/08/BK1MBM9H00052UUC.html",
 "postid": "BK1MBM9H00052UUC",
 "votecount": 20238,
 "replyCount": 22077,
 "ltitle": "看美国人如何评价姚明入选名人堂:\"摇钱树\"原罪?",
 "digest": "前NBA球星直言:\"姚明绝对，绝对不配入选名人堂\"。",
 "url": "http://3g.163.com/sports/16/0407/08/BK1MBM9H00052UUC.html",
 "docid": "BK1MBM9H00052UUC",
 "title": "美国人咋评价姚明入选名人堂?",
 "source": "东方早报",
 "imgextra": [
 {
 "imgsrc": "http://img2.cache.netease.com/3g/2016/4/8/2016040808115987ac9.jpg"
 },
 {
 "imgsrc": "http://img5.cache.netease.com/3g/2016/4/8/20160408081201515bb.jpg"
 }
 ],
 "priority": 122,
 "lmodify": "2016-04-07 09:06:19",
 "imgsrc": "http://img1.cache.netease.com/3g/2016/4/7/20160407090815b0963.png",
 "subtitle": "",
 "boardid": "sports_cba_bbs",
 "ptime": "2016-04-07 08:29:24"
 */

///查看人数
@property (nonatomic,strong) NSNumber *replyCount;
///新闻标题
@property (nonatomic, copy) NSString *title;
///新闻摘要
@property (nonatomic, copy) NSString *digest;
///新闻图片
@property (nonatomic, copy) NSString *imgsrc;
///新闻数组图片
@property (nonatomic, strong) NSArray *imgextra;

@property (nonatomic, assign) BOOL imgType;

+ (instancetype)newsWithDict:(NSDictionary *)dict;


+ (void)newsWithSuccess:(void(^)(NSArray *news))success error:(void(^)(NSError *error))error;



@end
