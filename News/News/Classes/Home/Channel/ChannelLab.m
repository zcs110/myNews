//
//  ChannelLab.m
//  News
//
//  Created by 朱长昇 on 15/7/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ChannelLab.h"

#define FontSizeBig 18.0
#define FontSizeNomal 14.0
@implementation ChannelLab

+(instancetype)LableWithTitle:(NSString *)title{

    ChannelLab *lab = [[ChannelLab alloc]init];
    lab.text = title;
    lab.font = [UIFont systemFontOfSize:FontSizeBig];
    [lab sizeToFit];
    lab.textAlignment = NSTextAlignmentCenter;
    
    lab.font = [UIFont systemFontOfSize:FontSizeNomal];
    [lab setUserInteractionEnabled:YES];
    return lab;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(channelLabDidSelected:)]) {

        [self.delegate channelLabDidSelected:self];
    
    }
}
-(void)setScale:(float)scale{

    float percent = (FontSizeBig -FontSizeNomal) /FontSizeNomal;
    
    percent = percent *scale + 1;
    
    self.transform = CGAffineTransformMakeScale(percent, percent);
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
    
    
}

@end
