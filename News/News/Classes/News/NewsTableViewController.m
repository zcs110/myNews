//
//  NewsTableViewController.m
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NewsNormalCell.h"
@interface NewsTableViewController ()

@property (nonatomic, strong) NSArray *NewsList;

@end

@implementation NewsTableViewController

-(void)setNewsList:(NSArray *)NewsList{

    _NewsList = NewsList;
    
    [self.tableView reloadData];
}
- (void)setUrlString:(NSString *)urlString {
    // urlString仅需要加载数据使用，可以不用记录
    //    _urlString = urlString;
    
    // 清空数据数组
    self.NewsList = nil;
    
    // 测试加载新闻
    __weak typeof(self) weakSelf = self;
    // @"T1348649580692/0-40.html"
    [NewsModel LoadNewsListWithURLString:urlString finished:^(NSArray *newsList) {
        // 设置数组数值
        weakSelf.NewsList = newsList;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //[NewsModel LoadNewsListWithURLString:@"T1348647853363/0-20.html"];

//    __weak typeof(self) weakSelf = self;
//    [NewsModel LoadNewsListWithURLString:@"T1348647853363/0-40.html" finished:^(NSArray *newsList) {
//        weakSelf.NewsList = newsList;
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.NewsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reusedID = @"NormalCell";

    NewsModel *model = self.NewsList[indexPath.row];
    if (model.imgextra.count == 2) {
        reusedID = @"ThreeIconCell";

    }else if(model.isBigImage){
        
        reusedID = @"BigImageCell";
    
    }else{
        reusedID = @"NormalCell";
    
    }
    
    NewsNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedID forIndexPath:indexPath];
    cell.NewsModel = self.NewsList[indexPath.row];

    // Configure the cell...
    
    return cell;
}


@end
