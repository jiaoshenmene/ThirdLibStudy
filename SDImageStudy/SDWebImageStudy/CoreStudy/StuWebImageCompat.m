//
//  StuWebImageCompat.m
//  ThirdLibStudy
//
//  Created by dujia on 16/8/6.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "StuWebImageCompat.h"


inline UIImage *StuScaledImageForKey(NSString *key , UIImage *image)
{
    if (!image) {
        return nil;
    }
    
    if ([image.images count] > 0) {
        NSMutableArray *scaledImages = [NSMutableArray array];
        
        for (UIImage *tempImage in image.images) {
            [scaledImages addObject:StuScaledImageForKey(key, tempImage)];
        }
        
        return [UIImage animatedImageWithImages:scaledImages duration:image.duration];
    }else{
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
            CGFloat scale = 1;
            if (key.length >= 8) {
                NSRange range = [key rangeOfString:@"@2x."];
                if (range.location != NSNotFound) {
                    scale = 2.0f;
                }
                
                range = [key rangeOfString:@"@3x."];
                if (range.location != NSNotFound) {
                    scale = 3.0f;
                }
            }
            
            UIImage *scaledImage = [[UIImage alloc] initWithCGImage:image.CGImage scale:scale orientation:image.imageOrientation];
            image = scaledImage;
        }
        return image;
    }
}

NSString *const StuWebImageErrorDomain = @"StuWebImageErrorDomain";
