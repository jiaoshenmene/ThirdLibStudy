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
};


typedef void (^StuWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);

typedef void (^StuWebImageDownloaderCompletedBlock)(UIImage *image , NSData *data , NSError *error , BOOL finished);

@interface StuWebImageDownloader : NSObject






/*
 *  The timeout value (in seconds) for the download operation. Default:15.0.
 */
@property (nonatomic , assign) NSTimeInterval downloadTimeout;





- (id<StuWebImageOperation>)downloadImageWithURL:(NSURL *)url options:(StuWebImageDownloaderOptions)options progress:(StuWebImageDownloaderProgressBlock)progressBlock completed:(StuWebImageDownloaderCompletedBlock)completedBlock;


@end
