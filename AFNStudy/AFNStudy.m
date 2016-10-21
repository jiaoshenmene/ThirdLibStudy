//
//  AFNStudy.m
//  AFNStudy
//
//  Created by dujia on 16/9/11.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "AFNStudy.h"
#import "GGNetWorkTool.h"

@implementation AFNStudy

+ (void)startStudy
{
    
    [self getTest];
    

    
}



+ (void) getTest
{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [[GGNetWorkTool getInstance] GET:@"http://live.9158.com/Living/GetAD" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

+ (void) postTest
{
    
}
@end
