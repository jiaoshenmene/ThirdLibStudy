//
//  UIImageView+WebCacheStudy.h
//  ThirdLibStudy
//
//  Created by dujia on 16/7/31.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "StuWebImageManager.h"
#import "StuImageCache.h"


@interface UIImageView (WebCacheStudy)

- (void) sd_study_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)image options:(StuWebImageOptions)options;


- (void) sd_study_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(StuWebImageOptions)options progress:(StuWebImageDownloaderProgressBlock)progressBlock completed:(StuWebImageDownloaderCompletedBlock)completedBlock;


@end
