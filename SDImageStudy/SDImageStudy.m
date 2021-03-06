//
//  SDImageStudy.m
//  SDImageStudy
//
//  Created by dujia on 16/7/30.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "SDImageStudy.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import "UIImageView+WebCacheStudy.h"

#import "UIView+WebCacheoperationStudy.h"
#import "StuImageCache.h"
#import "UIImage+Stu_MultiFormat.h"
#import "UIImage+StuForceDecode.h"

#import "StuWebImageDownloaderOperation.h"


#import "StuWebImageDownloader.h"



@interface SDImageStudy()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableview;

@property (nonatomic , strong) NSMutableArray *objects;

//@property ()
@end

@implementation SDImageStudy

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSLog(@"<<  =  %d",4 % 3);
    
    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 10, 10)];
    
    label.backgroundColor = [UIColor grayColor];
    label.numberOfLines = 1;
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    
    label.text = @"S";
    
    
//    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fff" ofType:@"png"]];
//////    StuImageCache *cache = [StuImageCache getInstance];
//////    [cache storeImageDataToDisk:data forKey:@"te12.jpg"];
//    UIImage *image = [UIImage stu_imageWithData:data];
//    
//    image = [UIImage stuDecodedImageWithImage:image];
    
    /*
     
     */
//    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
//    
//    NSURL *newUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@123.png",url ]];
////    [data writeToURL:newUrl atomically:YES];
//    
//    NSURL *referenceURL = newUrl.fileReferenceURL;
//    
//    NSURL *toURl = [NSURL URLWithString:[NSString stringWithFormat:@"%@/1235.png",url ]];
//    
//    
//    NSURL *bookmarkUrl =  [NSURL URLWithString:[NSString stringWithFormat:@"%@/987.png",url ]];
////    [[NSFileManager defaultManager] moveItemAtURL:referenceURL toURL:toURl error:nil];
//    
//
//    
//    NSLog(@"%@",url);
//    NSLog(@"newUrl = %@",newUrl);
//    NSData *data1 = [toURl bookmarkDataWithOptions:NSURLBookmarkCreationSuitableForBookmarkFile includingResourceValuesForKeys:nil relativeToURL:nil error:nil];
//    [NSURL writeBookmarkData:data1 toURL:bookmarkUrl options:0 error:nil];
//    
//    
//    NSURL *newBookmarkUrl = [NSURL URLByResolvingBookmarkData:data1 options:NSURLBookmarkResolutionWithoutUI relativeToURL:nil bookmarkDataIsStale:nil error:nil];
//
//    
//    UIImage *newImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:newBookmarkUrl options:NSDataReadingMappedIfSafe error:nil]];
//    UIImage *newImage1 = [UIImage imageWithData:data1];
//    
//    
////
////
////    
//////    StuImageCache *cache = [StuImageCache getInstance];
//////    [cache storeImageDataToDisk:data forKey:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage002.jpg"];
////    UIImage *image = [[UIImage alloc] init];//[cache diskImageForKey:@"gifdemo@2x.gif"];
//////
//////    [image sd_study_setImageWithUR];
//    UIImageView *imageview = [[UIImageView alloc] initWithImage:newImage];
//    imageview.frame = CGRectMake(10, 10, 100, 100);
//    [self.view addSubview:imageview];
//
////
//    [imageview sd_study_setImageWithURL:[NSURL URLWithString:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage001.jpg"] placeholderImage:nil options:0];
    
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    StuWebImageDownloader *downloader = [[StuWebImageDownloader alloc] init];
//    [downloader downloadImageWithURL:[NSURL URLWithString:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage001.jpg"] options:StuWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        
//    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        
//    }];
    
    // HTTP NTLM auth example
    // Add your NTLM image url to the array below and replace the credentials
//    [SDWebImageManager sharedManager].imageDownloader.username = @"httpwatch";
//    [SDWebImageManager sharedManager].imageDownloader.password = @"httpwatch01";
//    
//    _objects = [NSMutableArray arrayWithObjects:
//                @"http://www.httpwatch.com/httpgallery/authentication/authenticatedimage/default.aspx?0.35786508303135633",     // requires HTTP auth, used to demo the NTLM auth
//                @"http://assets.sbnation.com/assets/2512203/dogflops.gif",
//                @"http://www.ioncannon.net/wp-content/uploads/2011/06/test2.webp",
//                @"http://www.ioncannon.net/wp-content/uploads/2011/06/test9.webp",
//                nil];
//    
//    for (int i=0; i<30; i++) {
//        [_objects addObject:[NSString stringWithFormat:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage%03d.jpg", i]];
//    }
//    
//    [SDWebImageManager.sharedManager.imageDownloader setValue:@"SDWebImage Demo" forHTTPHeaderField:@"AppName"];
//    SDWebImageManager.sharedManager.imageDownloader.executionOrder = SDWebImageDownloaderLIFOExecutionOrder;
//    
//    _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    _tableview.delegate = self;
//    _tableview.dataSource = self;
//    [self.view addSubview:_tableview];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[_objects objectAtIndex:indexPath.row]] placeholderImage:nil options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
