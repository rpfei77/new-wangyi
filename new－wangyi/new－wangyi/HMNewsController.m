//
//  HMNewsController.m
//  new－wangyi
//
//  Created by 大米 on 16/4/7.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMNewsController.h"
#import "HMNews.h"
#import "HMNewsCell.h"

@interface HMNewsController ()

@property (nonatomic, strong) NSArray *newsList;
@end

@implementation HMNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //加载界面
    [self loadDate];
    
    //1.在ios7之后，如果项目中有导航控制器存在，则scrollView的默认的contentInset ＝ (64,0,0,0)
    self.automaticallyAdjustsScrollViewInsets = NO;
   }



- (void)loadDate{
    
    [HMNews newsWithSuccess:^(NSArray *news) {
        //NSLog(@"%@",news);
        
        self.newsList = news;
        //刷新界面
        [self.tableView reloadData];
        
        
    } error:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}



#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HMNews *news = self.newsList[indexPath.item];
    
    HMNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[HMNewsCell CellIdentifier:news]];
    
    // 设置 Cell
    cell.news = news;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     HMNews *news = self.newsList[indexPath.item];
    
    return [HMNewsCell cellHeight:news];
    
}




@end
