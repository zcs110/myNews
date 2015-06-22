//
//  NSDictionary+EX_ArrayAnd_Dic.m
//  0608
//
//  Created by 朱长昇 on 15/6/8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NSDictionary+EX_ArrayAnd_Dic.h"

@implementation NSDictionary (EX_ArrayAnd_Dic)

-(NSString *)descriptionWithLocale:(id)locale{

    NSMutableString *mStr = [NSMutableString stringWithFormat:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [mStr appendFormat:@"\t%@ = %@",key,obj];
        [mStr appendString:@"\r\n"];
    }];
    [mStr appendString:@"}"];
    
    
    return mStr;

}

@end

@implementation NSArray (EX_ArrayAnd_Dic)

-(NSString *)descriptionWithLocale:(id)locale{

    NSMutableString *mStr = [NSMutableString stringWithFormat:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [mStr appendFormat:@"\t%@\r\n",obj];
        
    }];
    [mStr appendString:@")"];
    
    return mStr;
}


@end