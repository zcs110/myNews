//
//  NewsModel.h
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

/**
 *  标题
 */

@property (nonatomic, copy) NSString *title;
/**
 *  描述
 */

@property (nonatomic, copy) NSString *digest;
/**
 *  图片
 */
@property (nonatomic, copy) NSString *imgsrc;

/**
 *  跟贴数量
 */
@property (nonatomic, assign) int replyCount;
/**
 *  来源  (optional)
 */
@property (nonatomic, copy) NSString *source;

/**
 *  加载指定的新闻组
 */

+(void)LoadNewsListWithURLString:(NSString *)urlString finished:(void(^)(NSArray *newsList))finished;




@end
