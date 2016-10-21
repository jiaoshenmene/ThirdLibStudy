//
//  GGNetWorkTool.m
//  ThirdLibStudy
//
//  Created by dujia on 16/9/11.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "GGNetWorkTool.h"



@implementation GGNetWorkTool

+ (instancetype)getInstance
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}


- (instancetype) init
{
    if (self = [super init]) {
        self.requestSerializer.timeoutInterval =5.0f;
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
        
    }
    return self;
}

@end
