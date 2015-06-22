//
//  NSObject+Extension.h
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/**
 *  遍历字典给属性赋值  @param dic 包含所有信息的数组  @return 包含指定属性的数组 
 */
+ (instancetype)objectWithDic:(NSDictionary *)dic;
/**
 *  加载类的属性数组
 */
+ (NSArray *)loadProperty;
@end
