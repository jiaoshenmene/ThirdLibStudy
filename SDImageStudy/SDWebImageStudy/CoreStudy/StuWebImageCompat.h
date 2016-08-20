//
//  StuWebImageCompat.h
//  ThirdLibStudy
//
//  Created by dujia on 16/8/6.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>


extern UIImage *StuScaledImageForKey(NSString *key , UIImage *image);

typedef void(^StuWebImageNoParamsBlock)();

extern NSString *const StuWebImageErrorDomain;

