//
//  StuWebImageDownloader.h
//  ThirdLibStudy
//
//  Created by dujia on 16/8/14.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StuWebImageCompat.h"
#import "StuWebImageOperation.h"


typedef NS_OPTIONS(NSUInteger, StuWebImageDownloaderOptions)
{
    StuWebImageDownloaderLowPriority = 1 << 0,
    
    StuWebImageDownloaderProgressiveDownload = 1 << 1,
    
    /**
     *  By default , request prevent the use of NSURLCache. With this flag, NSURLCache
     *  is used with default policies.
     */
    StuWebImageDownloaderUseNSURLCache = 1 << 2,
    
    /**
     *  Call completion block with nil image/imageData if the image was read from NSURLCache
     *  (to be combined with ``).
     */
    StuWebImageDownloaderIgnoreCachedResponse = 1 << 3,
    
    /**
     *  In iOS 4+, continue the download of the image if the app goes to background. This is achieved by asking the system for
     *  extra time in background to let the request finish.If the background task expires the operation will be cancelled.
     */
    StuWebImageDownloaderContinueInBackground = 1 << 4,
    
    /**
     *  Handles cookies stored in HSHTTPCookieStore by setting
     *  NSMutableURLRequest.HTTPShouldHandleCookies = YES;
     */
    StuWebImageDownloaderHandleCookies = 1 << 5,
    
    /*
     *  Enable to allow untrusted SSL certificates.
     *  Useful for testing purposes. Use with caution in production.
     */
    StuWebImageDownloaderAllowInvalidSSLCertificates = 1 << 6,
    
    /**
     *  Put the image in the high priority queue.
     */
    StuWebImageDownloaderHighPriority = 1 << 7 ,
};


typedef NSDictionary *(^StuWebImageDownloaderHeadersFilterBlock)(NSURL *url , NSDictionary *headers);

typedef void (^StuWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);

typedef void (^StuWebImageDownloaderCompletedBlock)(UIImage *image , NSData *data , NSError *error , BOOL finished);

@interface StuWebImageDownloader : NSObject


/*
 *  Decompressing images that are downloaded and cached can improve performance but can consume lot of memory.
 *  Defaults to YES. Set this to NO if you are experiencing a crash due to excessive memory consumption.
 */
@property (nonatomic , assign) BOOL shouldDecompressImages;



/*
 *  The timeout value (in seconds) for the download operation. Default:15.0.
 */
@property (nonatomic , assign) NSTimeInterval downloadTimeout;

/**
 *  Set filter to pick headers for downloading image HTTP request.
 *
 *  This block will be invoked for each downloading image request, returned
 *  NSDictionary will be used as headers in corresponding HTTP request.
 */
@property (nonatomic , copy) StuWebImageDownloaderHeadersFilterBlock headersFilter;



- (id<StuWebImageOperation>)downloadImageWithURL:(NSURL *)url options:(StuWebImageDownloaderOptions)options progress:(StuWebImageDownloaderProgressBlock)progressBlock completed:(StuWebImageDownloaderCompletedBlock)completedBlock;


@end
