//
//  HMHomeViewController.m
//  new－wangyi
//
//  Created by 大米 on 16/4/8.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMHomeViewController.h"
#import "HMNewsChannel.h"
#import "HMChannelLable.h"

@interface HMHomeViewController ()

///头条数组
@property (nonatomic, strong) NSArray *channel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加频道
    [self setupChannel];
}

//添加频道
- (void)setupChannel{
     //设置不需要自动调整滚动视图的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;

    CGFloat lableX = 5;
    CGFloat margs = 5;
    CGFloat lableY = 0;
    CGFloat lableH = self.scrollView.frame.size.height;
    
    
    for (HMNewsChannel *channel in self.channel) {
        //创建标签
        HMChannelLable *lable = [HMChannelLable lableWithTitle:channel.tname];
        
        //设置frame
        lable.frame = CGRectMake(lableX, lableY, lable.frame.size.width, lableH);
        
        
        //添加到scrollView
        [self.scrollView addSubview:lable];
        
        lableX += margs + lable.frame.size.width;
    }
    //设置滚动范围
    self.scrollView.contentSize = CGSizeMake(lableX, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - 懒加载
- (NSArray *)channel{
    
    if (_channel == nil) {
        _channel = [HMNewsChannel channels];
    }
    return _channel;
}

@end
