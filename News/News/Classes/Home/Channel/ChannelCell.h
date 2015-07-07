//
//  ChannelCell.h
//  News
//
//  Created by 朱长昇 on 15/7/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsTableViewController;

@interface ChannelCell : UICollectionViewCell
//负责传URLstring
@property (nonatomic, strong) NSString *urlString;

@property (nonatomic, strong) NewsTableViewController *NewsVC;

@end
