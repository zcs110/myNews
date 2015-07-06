//
//  ChannelLab.m
//  News
//
//  Created by 朱长昇 on 15/7/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ChannelLab.h"

@implementation ChannelLab

+(instancetype)LableWithTitle:(NSString *)title{

    ChannelLab *lab = [[ChannelLab alloc]init];
    lab.text = title;
    [lab sizeToFit];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:18];
    

    lab.font = [UIFont systemFontOfSize:14];

    return lab;
}

@end
