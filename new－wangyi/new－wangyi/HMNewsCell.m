//
//  HMNewsCell.m
//  new－wangyi
//
//  Created by 大米 on 16/4/8.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMNewsCell.h"
#import "HMNews.h"
#import <UIImageView+WebCache.h>

@interface HMNewsCell()

///新闻标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
///新闻摘要
@property (weak, nonatomic) IBOutlet UILabel *digestLable;
///查看人数
@property (weak, nonatomic) IBOutlet UILabel *replyCountLable;
///新闻图片
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
//新闻数组图片
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgsrcViews;

@end



@implementation HMNewsCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setNews:(HMNews *)news{
    
    _news = news;
    
    self.titleLabel.text = news.title;
    self.digestLable.text = news.digest;
    self.replyCountLable.text = [NSString stringWithFormat:@"%@人跟帖",news.replyCount?news.replyCount:@"0"];
    
    [self.imgsrcView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc] placeholderImage:nil options:SDWebImageRetryFailed | SDWebImageLowPriority];
    
    
   [news.imgextra enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
       
       
       UIImageView *imageView = self.imgsrcViews[idx];
       
       NSString *imgsrc = dict[@"imgsrc"];
       
       [imageView sd_setImageWithURL:[NSURL URLWithString:imgsrc] placeholderImage:nil options:SDWebImageRetryFailed | SDWebImageLowPriority];
       
       
   }];
    
}

//返回cell对应的重用标示
+ (NSString *)CellIdentifier:(HMNews *)news{
 
    if (news.imgextra) {
        return @"imageCell";
    }else if(news.imgType){
        return @"imgCell";
    }else{
        return @"news";
    }
}
//根据模型返回cell高度
+ (CGFloat)cellHeight:(HMNews *)news{
    
    if (news.imgextra) {
        return 130;
    }else if(news.imgType){
        return 150;
    }else{
        return 80;
    }

}




@end
