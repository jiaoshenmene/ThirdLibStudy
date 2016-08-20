//
//  NSData+StuImageContentType.m
//  ThirdLibStudy
//
//  Created by dujia on 16/8/6.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "NSData+StuImageContentType.h"

@implementation NSData (StuImageContentType)
+ (NSString *)stu_contentTypeForImageData:(NSData *)data
{
    uint8_t c;
    [data getBytes:&c length:1];
    NSLog(@"%d",c);
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
            break;
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
            
        case 0x49:
        case 0x4D:
            return @"image/tiff";
        case 0x52:
        {
            if ([data length] < 12) {
                return nil;
            }
            
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"image/webp";
            }
            return nil;
        }
    }
    return nil;
}

@end
