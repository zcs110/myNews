//
//  NetWorkTools.m
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NetWorkTools.h"


@implementation NetWorkTools

+(instancetype)ShareNetWorkTools{

    static NetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        
        //NSURL *baseURL = [NSURL URLWithString:@"http://localhost/videos.json"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        instance = [[self alloc] initWithBaseURL:baseURL sessionConfiguration:config];
       //设置解析的数据格式
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
    });
    return instance;
    
}
@end
