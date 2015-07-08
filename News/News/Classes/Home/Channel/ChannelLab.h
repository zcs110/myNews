//
//  ChannelLab.h
//  News
//
//  Created by 朱长昇 on 15/7/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChannelLabDeleagte;


@interface ChannelLab : UILabel
@property (nonatomic, assign) float scale;
@property (nonatomic,weak)  id<ChannelLabDeleagte>delegate;

+(instancetype)LableWithTitle:(NSString *)title;

@end

@protocol ChannelLabDeleagte <NSObject>

-(void)channelLabDidSelected:(ChannelLab *)lable;

@end
