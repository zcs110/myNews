//
//  NetWorkTools.h
//  News
//
//  Created by 朱长昇 on 15/6/22.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetWorkTools : AFHTTPSessionManager

//提供全局的访问接口
+(instancetype)ShareNetWorkTools;

@end
