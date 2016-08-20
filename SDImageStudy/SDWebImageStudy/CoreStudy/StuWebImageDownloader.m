//
//  StuWebImageDownloader.m
//  ThirdLibStudy
//
//  Created by dujia on 16/8/14.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "StuWebImageDownloader.h"
#import "StuWebImageOperation.h"
#import "StuWebImageDownloaderOperation.h"




@implementation StuWebImageDownloader


+ (instancetype)sharedDownloader
{
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (id) init
{
    if (self = [super init]) {
        _downloadTimeout = 15.0f;
        
    }
    return self;
}

- (id<StuWebImageOperation>)downloadImageWithURL:(NSURL *)url options:(StuWebImageDownloaderOptions)options progress:(StuWebImageDownloaderProgressBlock)progressBlock completed:(StuWebImageDownloaderCompletedBlock)completedBlock{
    
    __block StuWebImageDownloaderOptions *operation;
    __weak __typeof(self)wself = self;
    
    
    [self addProgressCallback:progressBlock completedBlock:completedBlock forURL:url createCallback:^{
        NSTimeInterval timeoutInterval = wself.downloadTimeout;
        if (timeoutInterval == 0.0) {
            timeoutInterval = 15.0;
        }
        
        //In order to prevent from potential duplicate caching (NSURLCache + SDImageCache) we disable
        
        NSLog(@"createCallback");
    }];
    
    
    
    return nil;
}

- (void)addProgressCallback:(StuWebImageDownloaderProgressBlock)progressBlock completedBlock:(StuWebImageDownloaderCompletedBlock)completedBlock forURL:(NSURL *)url createCallback:(StuWebImageNoParamsBlock)createCallback{
    if (url == nil) {
        if (completedBlock != nil) {
            completedBlock(nil,nil,nil,NO);
        }
        return;
    }
    
    
    createCallback();
    
    
    
    
}

@end
