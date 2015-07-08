//
//  Channel.m
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "Channel.h"
#import "NSObject+Extension.h"
@implementation Channel

-(void)setTid:(NSString *)tid{
    _tid = tid.copy;
    _urlString = [NSString stringWithFormat:@"%@/0-40.html",_tid];
}

+(NSArray *)channelList{

    //1加载 json 的二进制数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //2反序列化
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];

    //3get DIC data
    NSArray *array = dic[dic.keyEnumerator.nextObject];
    
    //4 DIC to model
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *obj in array) {
        [arrayM addObject:[self objectWithDic:obj]];
    }
    return arrayM.copy;
}
// description 不要抽取，放在各自类中，写不好会死循环！
- (NSString *)description {
    NSArray *propertis = [self.class loadProperty];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}
@end
