//
//  Channel.h
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject
@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, strong, readonly) NSString *urlString;
+(NSArray *)channelList;

@end
