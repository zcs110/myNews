//
//  NewsModel.m
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NewsModel.h"
#import "NetWorkTools.h"
#import <objc/runtime.h>
@implementation NewsModel
/**
 *  遍历字典给属性赋值
 *
 *  @param dic <#dic description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)newsWithDic:(NSDictionary *)dic{

    
    id obj = [[self alloc] init];
    // 拿到属性列表
    NSArray *properties = [self loadProperty];
    for (NSString *key in properties) {
        if (dic[key] != nil) {
            [obj setValue:dic[key] forKeyPath:key];
        }
    }
    return obj;
}

const char *kPropertiesKey = "kPropertiesKey";
/**
 *  运行时动态加载属性
 *
 *  @return 返回属性数组
 */
+ (NSArray *)loadProperty{

    NSArray *pList = objc_getAssociatedObject(self, kPropertiesKey);
    if (pList != nil) {
        return pList;
    }
    
    unsigned int Count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &Count);
    
    NSLog(@"%u",Count);
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:Count];
    
    for (unsigned int i=0; i<Count; i++) {
        objc_property_t pty = list[i];
        const char *cName = property_getName(pty);
        [arrayM addObject:[NSString stringWithUTF8String:cName]];
    
    }
    free(list);
    
    objc_setAssociatedObject(self, kPropertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return objc_getAssociatedObject(self, kPropertiesKey);
}

+(void)LoadNewsListWithURLString:(NSString *)urlString{

    [[NetWorkTools ShareNetWorkTools] GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@", [responseObject keyEnumerator].nextObject);
        NSArray *array = responseObject[[responseObject keyEnumerator].nextObject];
        NSLog(@"%@",array);
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        /**
         *  拿到Key Value 添加到可变数组
         */
        for (NSDictionary *dic in array) {
            [arrayM addObject:[self newsWithDic:dic]];
        }
        NSLog(@"%@",arrayM);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@", error);
        
    }];
    
}
@end
