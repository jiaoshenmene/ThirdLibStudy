//
//  StuWebImageDownloaderOperation.m
//  ThirdLibStudy
//
//  Created by dujia on 16/8/14.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "StuWebImageDownloaderOperation.h"
#import "UIImage+StuForceDecode.h"
#import "StuWebImageCompat.h"

@interface StuWebImageDownloaderOperation()



@end


@implementation StuWebImageDownloaderOperation
{
    
}

- (id) initWithRequest:(NSURLRequest *)request
               options:(StuWebImageDownloaderOptions)options
              progress:(StuWebImageDownloaderProgressBlock)progress
             completed:(StuWebImageDownloaderCompletedBlock)completedBlock
             cancelled:(StuWebImageNoParamsBlock)cancelBlock
{
    if (self = [super init]) {
        
        
    }
    return self;
}


- (void)start
{
    NSLog(@"start");
}



@end
