//
//  GGNetWorkTool.h
//  ThirdLibStudy
//
//  Created by dujia on 16/9/11.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface GGNetWorkTool : AFHTTPSessionManager
+ (instancetype)getInstance;
@end
