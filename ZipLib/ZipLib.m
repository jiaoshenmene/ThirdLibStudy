//
//  ZipLib.m
//  ZipLib
//
//  Created by dujia on 21/10/2016.
//  Copyright © 2016 dujia. All rights reserved.
//

#import "ZipLib.h"
#import "ZipArchive.h"
@implementation ZipLib

+ (void)startZip
{
    NSArray *zipFileName = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *docPath = [zipFileName objectAtIndex:0];
    NSLog(@"%@",docPath);
    NSString *zipPath = [[zipFileName objectAtIndex:0] stringByAppendingPathComponent:@"en_user.ssf"];
    NSString *path;
    
    
    NSString *sourcePath = [docPath stringByAppendingPathComponent:@"ios7"];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:sourcePath];
    ZipArchive *zipArchive = [[ZipArchive alloc] init];
    [zipArchive CreateZipFile2:zipPath];
    
//    [zip cre]
    while ((path = [dirEnum nextObject]) != nil)
    {
        NSString *sPath = [sourcePath stringByAppendingPathComponent:path];
        [zipArchive addFileToZip:sPath newname:path];
        NSLog(@"%@",path);
    }
    [zipArchive CloseZipFile2];
//    NSArray *array = [NSArray arrayWithContentsOfFile:[]]
    
    
    
    
    
    
}

@end
