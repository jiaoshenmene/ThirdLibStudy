//
//  UIImageView+WebCacheStudy.m
//  ThirdLibStudy
//
//  Created by dujia on 16/7/31.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "UIImageView+WebCacheStudy.h"
#import <UIImageView+WebCache.h>
#import "UIView+WebCacheoperationStudy.h"
#import <objc/runtime.h>
#import "StuWebImageDownloaderOperation.h"
#import "StuWebImageManager.h"



static char imageURLKey_study;
static char TAG_ACTIVITY_SHOW_STUDY;

@implementation UIImageView (WebCacheStudy)


- (void) sd_study_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)image options:(StuWebImageOptions)options
{
    [self sd_study_setImageWithURL:url placeholderImage:image options:options progress:nil completed:nil];
}


- (void) sd_study_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(StuWebImageOptions)options progress:(StuWebImageDownloaderProgressBlock)progressBlock completed:(StuWebImageDownloaderCompletedBlock)completedBlock
{
    [self study_cancelCurrentImageLoad];
    objc_setAssociatedObject(self, &imageURLKey_study, url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!(options & SDWebImageDelayPlaceholder)) {
        dispatch_main_async_safe(^{
            self.image = placeholder;
        });
    }
    
    if (url) {
        if ([self showActivityIndicatorView]) {
            
        }
        
        id<StuWebImageOperation> operation = [[StuWebImageManager sharedManager] downloadImageWithURL:url
                                                                                              options:options
                                                                                             progress:progressBlock completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                                                                                                 
                                                                                             }];
        
        
    }
    
    
}

- (void) study_cancelCurrentImageLoad
{
    [self sd_study_cancelImageLoadOperationWithKey:@"UIImageViewImageLoad"];
}

#pragma mark -

- (BOOL)showActivityIndicatorView{
    return [objc_getAssociatedObject(self, &TAG_ACTIVITY_SHOW_STUDY) boolValue];
}



@end
