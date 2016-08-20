//
//  StuImageCache.h
//  ThirdLibStudy
//
//  Created by dujia on 16/7/31.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StuImageCache : NSObject


/*
 *  Decompressing images that are downloaded and cached can improve performance but can consume lot of memory.
 *  Defaults to YES. Set this to NO if you are experiencing a crash due to excessive memory consumption.
 */
@property (nonatomic , assign) BOOL shouldDecompressImages;

/*
 *  Use memory cache [defaults to YES]
 */
@property (nonatomic , assign) BOOL shouldCacheImagesInMemory;


+ (StuImageCache *)getInstance;

- (void) storeImageDataToDisk:(NSData *)imageData forKey:(NSString *)key;

- (UIImage *)diskImageForKey:(NSString *)key;

@end
