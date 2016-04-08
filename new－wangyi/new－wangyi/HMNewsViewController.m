//
//  HMNewsViewController.m
//  new－wangyi
//
//  Created by 大米 on 16/4/5.
//  Copyright © 2016年 大米. All rights reserved.
//

#import "HMNewsViewController.h"
#import "HMNetworkTool.h"
#import "HMHeadLine.h"
#import "HMHeadLineCell.h"



@interface HMNewsViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
///布局参数
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayout;

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
///标题
@property (nonatomic, weak) IBOutlet UILabel *titleLable;
///标示
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

@property (nonatomic, assign) long  sectionCount;

///头条数据
@property (nonatomic, strong) NSArray *headLines;

@end

@implementation HMNewsViewController

static NSString * const reuseIdentifier = @"HeadLine";

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.sectionCount = 30000;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //加载数据
    [self loadData];
    
}

// 控制器布局完成的时候调用
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //设置布局
    [self setuplayout];
}


//设置布局
- (void)setuplayout{
    //设置布局
    self.flowlayout.itemSize = self.collectionView.bounds.size;
    //设置item之间的间隙
    self.flowlayout.minimumLineSpacing = NO;
    //设置滚动的方向
    self.flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    //设置分页
    self.collectionView.pagingEnabled = YES;
    //去除弹簧效果
    self.collectionView.bounces = NO;
    
    //隐藏水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

//组数
#define HMGroupCount 10000

- (void)loadData{
    
    [HMHeadLine HeadLineWithSuccess:^(NSArray *headLines) {
      
        
        self.headLines = headLines;
        //刷新界面
        [self.collectionView reloadData];
        //默认在中间行
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:HMGroupCount * 0.5] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        //设置标题
        [self scrollViewDidScroll:self.collectionView];
        
    } error:^(NSError *error) {
        //NSLog(@"%@",error);
    }];
    
}




#pragma mark <UICollectionViewDataSource>
//组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return HMGroupCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.headLines.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMHeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
   //获得模型
    HMHeadLine *headline = self.headLines[indexPath.item];
    cell.headline = headline;
    
    return cell;
}

#pragma mark - scrollView 的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger pag = (scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5) / scrollView.bounds.size.width;
    
    pag %= self.headLines.count;
    
    HMHeadLine *headline = self.headLines[pag];
    self.titleLable.text = headline.title;
    self.pageControl.currentPage = pag;
}










@end
