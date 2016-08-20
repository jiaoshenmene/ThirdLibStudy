//
//  UIImage+stuGIF.h
//  ThirdLibStudy
//
//  Created by dujia on 16/8/6.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (stuGIF)
//+ (UIImage *)stu_animatedGIFName:(NSString *)name;

+ (UIImage *)stu_animatedGIFWithData:(NSData *)data;

//- (UIImage *)stu_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end
