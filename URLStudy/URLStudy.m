//
//  URLStudy.m
//  URLStudy
//
//  Created by dujia on 16/9/4.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "URLStudy.h"
#import <UIKit/UIKit.h>

@implementation URLStudy

- (id) init
{
    if (self = [super init]) {
        /*
         
         */
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
        
        NSURL *newUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@123.png",url ]];
        //    [data writeToURL:newUrl atomically:YES];
        
        NSURL *referenceURL = newUrl.fileReferenceURL;
        
        NSURL *toURl = [NSURL URLWithString:[NSString stringWithFormat:@"%@/1235.png",url ]];
        
        
        NSURL *bookmarkUrl =  [NSURL URLWithString:[NSString stringWithFormat:@"%@/987.png",url ]];
        //    [[NSFileManager defaultManager] moveItemAtURL:referenceURL toURL:toURl error:nil];
        
        
        
        NSLog(@"%@",url);
        NSLog(@"newUrl = %@",newUrl);
        NSData *data1 = [toURl bookmarkDataWithOptions:NSURLBookmarkCreationSuitableForBookmarkFile includingResourceValuesForKeys:nil relativeToURL:nil error:nil];
        [NSURL writeBookmarkData:data1 toURL:bookmarkUrl options:0 error:nil];
        
        
        NSURL *newBookmarkUrl = [NSURL URLByResolvingBookmarkData:data1 options:NSURLBookmarkResolutionWithoutUI relativeToURL:nil bookmarkDataIsStale:nil error:nil];
        
        
        UIImage *newImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:newBookmarkUrl options:NSDataReadingMappedIfSafe error:nil]];

    }
    return self;
}

@end
