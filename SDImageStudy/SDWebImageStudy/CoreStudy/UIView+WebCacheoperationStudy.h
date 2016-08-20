//
//  UIView+WebCacheoperationStudy.h
//  ThirdLibStudy
//
//  Created by dujia on 16/7/30.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WebCacheoperationStudy)
- (void)sd_study_setImageLoadOperation:(id)operation forKey:(NSString *)key;

- (void)sd_study_removeImageLoadOperationWithKey:(NSString *)key;
- (void) sd_study_cancelImageLoadOperationWithKey:(NSString *)key;

@end
