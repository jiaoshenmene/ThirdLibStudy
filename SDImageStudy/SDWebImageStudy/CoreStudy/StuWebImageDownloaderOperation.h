//
//  StuWebImageDownloaderOperation.h
//  ThirdLibStudy
//
//  Created by dujia on 16/8/14.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuWebImageDownloader.h"
#import "StuWebImageOperation.h"


@interface StuWebImageDownloaderOperation : NSOperation <StuWebImageOperation>
- (id) initWithRequest:(NSURLRequest *)request
               options:(StuWebImageDownloaderOptions)options
              progress:(StuWebImageDownloaderProgressBlock)progress
             completed:(StuWebImageDownloaderCompletedBlock)completedBlock
             cancelled:(StuWebImageNoParamsBlock)cancelBlock;

@end
