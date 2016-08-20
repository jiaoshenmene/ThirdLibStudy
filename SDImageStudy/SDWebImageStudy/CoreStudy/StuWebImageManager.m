//
//  StuWebImageManager.m
//  ThirdLibStudy
//
//  Created by dujia on 16/8/14.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "StuWebImageManager.h"
#import <objc/message.h>

@interface StuWebImageCombinedOperation : NSObject <StuWebImageOperation>

@property (nonatomic , assign , getter= isCancelled) BOOL cancelled;

@property (nonatomic , copy) StuWebImageNoParamsBlock cancelBlock;

@property (nonatomic , strong) NSOperation *cacheOperation;

@end

@implementation StuWebImageCombinedOperation

@end


@interface StuWebImageManager()

@property (nonatomic , strong , readwrite) StuImageCache *imageCache;
@property (nonatomic , strong , readwrite) StuWebImageDownloader *imageDownloader;
@property (nonatomic , strong) NSMutableSet *failedURLs;
@property (nonatomic , strong) NSMutableArray *runningOperations;

@end

@implementation StuWebImageManager

+ (StuWebImageManager *)sharedManager
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype) init
{
    if (self = [super init]) {
        _imageCache = [self createCache];
//        _imageDownloader = [StuWebImageDownloader get];
    }
    return self;
}

- (StuImageCache *)createCache
{
    return [StuImageCache getInstance];
}

- (id <StuWebImageOperation>) downloadImageWithURL:(NSURL *)url
                                           options:(StuWebImageOptions)options
                                          progress:(StuWebImageDownloaderProgressBlock)progressBlock
                                         completed:(StuWebImageDownloaderCompletedBlock)completedBlock
{
    /* Invoking this method without a completedBlock is pointless */
    NSAssert(completedBlock != nil, @"If you mean to prefetch the image, use -[StuWebImagePrefetcher prefetchURLs] instead");
    
    /*
     Very common mistake is to send the URL using NSString object instead of NSURL. For some strange reason, Xcode won't
     throw any warning for this type mismatch. Here we failsafe this error by allowing URLs to be passed as NSString.
     */
    
    if ([url isKindOfClass:NSString.class]) {
        url = [NSURL URLWithString:(NSString *)url];
    }
    
    /* Prevents app crashing on argument type error like sending NSNull instead of NSURL */
    if (![url isKindOfClass:[NSURL class]]) {
        url = nil;
    }
    
    __block StuWebImageCombinedOperation *operation = [StuWebImageCombinedOperation new];
    __weak StuWebImageCombinedOperation *weakOperation = operation;
    BOOL isFailedUrl = NO;
    @synchronized (self.failedURLs) {
        isFailedUrl = [self.failedURLs containsObject:url];
    }
    
        
    NSLog(@"mmmmmmmmmmmm");
    
    return operation;
}

@end
