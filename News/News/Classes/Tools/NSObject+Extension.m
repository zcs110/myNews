//
//  NSObject+Extension.m
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>
@implementation NSObject (Extension)
/**
 *  遍历字典给属性赋值
 *
 *  @param dic 包含所有信息的数组
 *
 *  @return 包含指定属性的数组
 */
+ (instancetype)objectWithDic:(NSDictionary *)dic{
    
    
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
/**
 *  运行时动态加载属性
 *
 *  @return 返回属性数组
 */
const char *kPropertiesKey = "kPropertiesKey";
+ (NSArray *)loadProperty{
    
    NSArray *pList = objc_getAssociatedObject(self, kPropertiesKey);
    if (pList != nil) {
        return pList;
    }
    
    unsigned int Count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &Count);
    
    // NSLog(@"%u ",Count);
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

@end
