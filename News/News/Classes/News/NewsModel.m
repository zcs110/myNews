//
//  NewsModel.m
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NewsModel.h"
#import "NetWorkTools.h"
#import "NSObject+Extension.h"
@implementation NewsModel
/**
 *  遍历字典给属性赋值
 *
 *  @param dic 包含所有信息的数组
 *
 *  @return 包含指定属性的数组
 */

- (NSString *)description {
    NSArray *propertis = [self.class loadProperty];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}

+(void)LoadNewsListWithURLString:(NSString *)urlString finished:(void (^)(NSArray *))finished{

     NSAssert(finished != nil, @"必须传入完成回调");
    [[NetWorkTools ShareNetWorkTools] GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        //NSLog(@"%@", [responseObject keyEnumerator].nextObject);
        NSArray *array = responseObject[[responseObject keyEnumerator].nextObject];
        //NSLog(@"%@",array);
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        /**
         *  拿到Key Value 添加到可变数组
         */
        for (NSDictionary *dic in array) {
            [arrayM addObject:[self objectWithDic:dic]];
        }
        //NSLog(@"%@",arrayM);
        finished(arrayM.copy);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@", error);
        
    }];
    
}
@end
