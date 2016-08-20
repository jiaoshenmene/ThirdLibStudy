//
//  NSData+StuImageContentType.h
//  ThirdLibStudy
//
//  Created by dujia on 16/8/6.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (StuImageContentType)

/*
 Compute the content type for an image data
 
 @param data the input data
 
 @return the content type as string (i.e. image/jpeg , image/gif)
 
 */

+ (NSString *)stu_contentTypeForImageData:(NSData *)data;

@end
