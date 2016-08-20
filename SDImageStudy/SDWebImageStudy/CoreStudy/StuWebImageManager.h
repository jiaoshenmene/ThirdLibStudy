//
//  StuWebImageManager.h
//  ThirdLibStudy
//
//  Created by dujia on 16/8/14.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuWebImageDownloader.h"
#import "StuWebImageOperation.h"
#import "StuImageCache.h"


typedef NS_OPTIONS(NSUInteger, StuWebImageOptions)
{
    /*
     
     */
    StuWebImageRetryFailed = 1 << 0,
    
    
    
};


@interface StuWebImageManager : NSObject

@property (nonatomic , strong , readonly) StuImageCache *imageCache;


+ (StuWebImageManager *)sharedManager;


- (id <StuWebImageOperation>) downloadImageWithURL:(NSURL *)url
                                           options:(StuWebImageOptions)options
                                          progress:(StuWebImageDownloaderProgressBlock)progressBlock
                                         completed:(StuWebImageDownloaderCompletedBlock)completedBlock;


@end
