//
//  HomeViewController.m
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "HomeViewController.h"
#import "Channel.h"
#import "ChannelLab.h"
#import "ChannelCell.h"
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ChannelLabDeleagte>
@property (weak, nonatomic) IBOutlet UIView *TitleView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrowView;
@property (nonatomic, strong) NSArray *channelList;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation HomeViewController
#pragma 懒加载

-(NSArray *)channelList{

    if (_channelList == nil) {
        _channelList = [Channel channelList];
    }
    return _channelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setLabList];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  设置频道
 */
-(void)setLabList{

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 遍历频道数组，添加 label
    CGFloat margin = 8.0;
    CGFloat x = margin;
    CGFloat h = self.scrowView.bounds.size.height;

    int Labtag = 0;
    for (Channel *channel in self.channelList ) {
        
        ChannelLab *lab = [ChannelLab LableWithTitle:channel.tname];
        lab.frame = CGRectMake(x, 0, lab.frame.size.width, h);
        x += lab.frame.size.width;
        lab.tag = Labtag;
        lab.delegate = self;
        Labtag ++;
        [self.scrowView addSubview:lab];
    }

    self.scrowView.contentSize = CGSizeMake(x + margin, h);
    
    //设置当前的选中行
    self.currentIndex = 0;
    ChannelLab *defaultLab = self.scrowView.subviews[0];
    defaultLab.scale = 1;
}


-(void)viewDidLayoutSubviews{

    [super viewDidLayoutSubviews];
    [self setupLoad];
}

//设置collectionView
-(void)setupLoad{

    self.flowLayout.itemSize = self.collectionView.bounds.size;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pagingEnabled = YES;

}
#pragma mark - channelLab Delegate

-(void)channelLabDidSelected:(ChannelLab *)lable{
    NSLog(@"%zd",lable.tag);
    self.currentIndex = lable.tag;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.currentIndex inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
}
#pragma mark - scrollView Delegate方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 当前标签
    ChannelLab *currentLable = self.scrowView.subviews[self.currentIndex];
    NSLog(@"scrollViewDidScroll %@",currentLable.text);
    // 下一个标签
    
    NSArray *indexPath = [self.collectionView indexPathsForVisibleItems];
    ChannelLab *nextLab = nil;
    for (NSIndexPath *path in indexPath) {
        if (path.item != self.currentIndex) {
            nextLab = self.scrowView.subviews[path.item];
            break;
        }
        
    }
    NSLog(@"从 %@ 到 %@",currentLable.text,nextLab.text);
    if (nextLab == nil) {
        return;
    }
    
    float nextScale =ABS((float) scrollView.contentOffset.x / self.view.bounds.size.width - self.currentIndex);

    float currentScale = 1 - nextScale;
   // NSLog(@"current  %f  next %f",currentScale,nextScale);
    currentLable.scale = currentScale;
    nextLab.scale = nextScale;
    //强制更新索引
    self.currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
   // self.currentIndex = self.collectionView.contentOffset.x / self.collectionView.bounds.size.width;
}
//更新索引
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //self.currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
}
#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ReusdeCell = @"CollectionCell";
    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReusdeCell forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    cell.urlString = [self.channelList[indexPath.item] urlString];
    //多控制器时   ***一定要添加子控制器***
    
    if (![self.childViewControllers containsObject:cell.NewsVC]) {
        [self addChildViewController:(UIViewController *)cell.NewsVC];
    }
    
   // NSLog(@"%@",self.childViewControllers);
    return cell;
}
@end
