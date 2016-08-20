//
//  StuImageCache.m
//  ThirdLibStudy
//
//  Created by dujia on 16/7/31.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "StuImageCache.h"
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
#import "UIImage+Stu_MultiFormat.h"
#import "StuWebImageCompat.h"



@interface AutoPurgeCache_Study : NSCache
@end

@implementation AutoPurgeCache_Study

- (instancetype) init
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeAllObjects) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}

@end


static const NSInteger kDefaultCacheMaxCacheAge = 60 * 60 * 24 * 7;

static unsigned char kPNGSignatureBytes[8] = {0x89 , 0x50 , 0x4E , 0x47 , 0x0D , 0x0A , 0x1A , 0x0A};

static NSData *kPNGSignatureData = nil;

FOUNDATION_STATIC_INLINE NSUInteger StuCacheCostForImage(UIImage *image){
    return image.size.height * image.size.width * image.scale * image.scale;
}
@interface StuImageCache()

@property (nonatomic , strong) AutoPurgeCache_Study *memCache;

@property (nonatomic , strong) NSString *diskCachePath;

@property (nonatomic , strong) dispatch_queue_t ioQueue;

@property (nonatomic , assign) NSInteger maxCacheAge;



@end

@implementation StuImageCache
{
    NSFileManager *_fileManager;
}


+ (StuImageCache *)getInstance
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}


- (instancetype)init
{
    return [self initWithNamespace:@"default"];
}

- (instancetype) initWithNamespace:(NSString *)ns
{
    NSString *path = [self makeDiskCachePath:ns];
    return [self initWithNamespace:ns diskCacheDirectory:path];
}

- (instancetype) initWithNamespace:(NSString *)ns diskCacheDirectory:(NSString *)directory
{
    if (self = [super init]) {
        
        NSString *fullNamespace = [@"com.hackemist.SDWebImageCache." stringByAppendingString:ns];
        NSLog(@"fullNamespace = %@",fullNamespace);
        
        kPNGSignatureData = [NSData dataWithBytes:&kPNGSignatureData length:8];
        
        _ioQueue = dispatch_queue_create("com.hackmist.SDWebImageCache", DISPATCH_QUEUE_SERIAL);
        
        _maxCacheAge = kDefaultCacheMaxCacheAge;
        
        _memCache = [[AutoPurgeCache_Study alloc] init];
        _memCache.name = fullNamespace;
        
        if (directory != nil) {
            _diskCachePath = [directory stringByAppendingPathComponent:fullNamespace];
        }else{
            NSString *path = [self makeDiskCachePath:ns];
            _diskCachePath = path;
        }
        
        _shouldCacheImagesInMemory = YES;
        
        _shouldDecompressImages = YES;
        
        
        dispatch_sync(_ioQueue, ^{
            _fileManager = [NSFileManager new];
        });
        
        
        
    }
    return self;
}

- (void) storeImage:(UIImage *)image recalculateFromImage:(BOOL)recalculate imageData:(NSData *)imageData forKey:(NSString *)key toDisk:(BOOL)toDisk
{
    if (!image || !key) {
        return;
    }
    
    if (_shouldCacheImagesInMemory) {
        NSUInteger cost = StuCacheCostForImage(image);
        [self.memCache setObject:image forKey:key cost:cost];
    }
    
    if (toDisk) {
        dispatch_async(self.ioQueue, ^{
            NSData *data = imageData;
            if (image && (recalculate || !data)) {
                
            }
           [self storeImageDataToDisk:imageData forKey:key];
        });
    }
    
    
    
    
}


- (void) storeImageDataToDisk:(NSData *)imageData forKey:(NSString *)key
{
    if (!imageData) {
        return;
    }
    NSLog(@"%@",_diskCachePath);
    
    if (![_fileManager fileExistsAtPath:_diskCachePath]) {
        [_fileManager createDirectoryAtPath:_diskCachePath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    NSString *cachePathForKey = [self defaultCachePathForKey:key];

    
    [_fileManager createFileAtPath:cachePathForKey contents:imageData attributes:nil];
}

- (NSString *)cachePathForKey:(NSString *)key inPath:(NSString *)path
{
    NSString *filename = [self cachedFileNameForKey:key];
    return [path stringByAppendingPathComponent:filename];
}

- (NSString *)defaultCachePathForKey:(NSString *)key
{
    return [self cachePathForKey:key inPath:self.diskCachePath];
}




#pragma mark  --- (private)
- (NSString *) cachedFileNameForKey:(NSString *)key
{
    const char *str = [key UTF8String];
    if (str == NULL) {
        str = "";
    }
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%@",r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15], [[key pathExtension] isEqualToString:@""] ? @"" : [NSString stringWithFormat:@".%@",[key pathExtension]] ];
    return filename;
}

#pragma mark cache
- (NSString *) makeDiskCachePath:(NSString *)fullNamespace
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingPathComponent:fullNamespace];
}



- (UIImage *)diskImageForKey:(NSString *)key
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gifdemo@2x" ofType:@"gif"]];
    if (data) {
        UIImage *image = [UIImage stu_imageWithData:data];
        image = [self scaledImageForkey:key image:image];
        return image;
    }
    return nil;
}

- (UIImage *)scaledImageForkey:(NSString *)key image:(UIImage *)image
{
    return StuScaledImageForKey(key, image);
}

@end
