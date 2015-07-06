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
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *TitleView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrowView;
@property (nonatomic, strong) NSArray *channelList;

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

-(void)setLabList{

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 遍历频道数组，添加 label
    CGFloat margin = 8.0;
    CGFloat x = margin;
    CGFloat h = self.scrowView.bounds.size.height;

    for (Channel *channel in self.channelList ) {
        
        ChannelLab *lab = [ChannelLab LableWithTitle:channel.tname];
        
        lab.frame = CGRectMake(x, 0, lab.frame.size.width, h);
        //NSLog(@"%@",NSStringFromCGRect(lab.frame));
        x += lab.frame.size.width;
        [self.scrowView addSubview:lab];
    }
    
    self.scrowView.contentSize = CGSizeMake(x + margin, h);
    
}


@end
