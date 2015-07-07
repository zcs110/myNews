//
//  ChannelCell.m
//  News
//
//  Created by 朱长昇 on 15/7/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ChannelCell.h"
#import "NewsTableViewController.h"
@interface ChannelCell()

@end
@implementation ChannelCell

-(void)setUrlString:(NSString *)urlString{

    _urlString = urlString;
    
    self.NewsVC.urlString = urlString;
    
}
-(void)awakeFromNib{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    self.NewsVC = sb.instantiateInitialViewController;
    
    [self addSubview:self.NewsVC.view];
    
    
}
-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.NewsVC.view.frame = self.bounds;
    //[self setNeedsLayout];
}
@end
