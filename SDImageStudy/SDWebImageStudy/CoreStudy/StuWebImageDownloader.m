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


@interface StuWebImageDownloader()

@property (nonatomic , strong) NSOperationQueue *downloadQueue;
@property (nonatomic , assign) Class operationClass;
@property (nonatomic , strong) NSMutableDictionary *HTTPHeaders;

@end

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
        
        _operationClass = [StuWebImageDownloaderOperation class];
        _shouldDecompressImages = YES;
        _downloadQueue = [NSOperationQueue new];
        _downloadQueue.maxConcurrentOperationCount = 6;
        
        _HTTPHeaders = [@{@"Accept": @"image/*;q=0.8"} mutableCopy];
        
        _downloadTimeout = 15.0f;
        
    }
    return self;
}

- (id<StuWebImageOperation>)downloadImageWithURL:(NSURL *)url options:(StuWebImageDownloaderOptions)options progress:(StuWebImageDownloaderProgressBlock)progressBlock completed:(StuWebImageDownloaderCompletedBlock)completedBlock{
    
    __block StuWebImageDownloaderOperation *operation;
    __weak __typeof(self)wself = self;
    
    
    [self addProgressCallback:progressBlock completedBlock:completedBlock forURL:url createCallback:^{
        NSTimeInterval timeoutInterval = wself.downloadTimeout;
        if (timeoutInterval == 0.0) {
            timeoutInterval = 15.0;
        }
        
        //In order to prevent from potential duplicate caching (NSURLCache + SDImageCache) we disable the cache for image requests if told otherwise
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:(options & StuWebImageDownloaderUseNSURLCache ? NSURLRequestUseProtocolCachePolicy : NSURLRequestReloadIgnoringCacheData) timeoutInterval:timeoutInterval];
        
        request.HTTPShouldHandleCookies = (options & StuWebImageDownloaderHandleCookies);
        request.HTTPShouldUsePipelining = YES;
        if (wself.headersFilter) {
//            request.allHTTPHeaderFields = wself.headersFilter(url , [wself.htt]);
        }else{
            request.allHTTPHeaderFields = wself.HTTPHeaders;
        }
        
        operation = [[wself.operationClass alloc] initWithRequest:request options:options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            
            
        } cancelled:^{
            
        }];
        operation.shouldDecompressImages = wself.shouldDecompressImages;
        
        
        
        [wself.downloadQueue addOperation:operation];
        
        NSLog(@"createCallback");
    }];
    
    
    
    return operation;
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
