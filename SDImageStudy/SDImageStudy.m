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
@end

@implementation SDImageStudy

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fff" ofType:@"png"]];
//////    StuImageCache *cache = [StuImageCache getInstance];
//////    [cache storeImageDataToDisk:data forKey:@"te12.jpg"];
//    UIImage *image = [UIImage stu_imageWithData:data];
//    
//    image = [UIImage stuDecodedImageWithImage:image];
//    
//
//    
////    StuImageCache *cache = [StuImageCache getInstance];
////    [cache storeImageDataToDisk:data forKey:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage002.jpg"];
//    UIImage *image = [[UIImage alloc] init];//[cache diskImageForKey:@"gifdemo@2x.gif"];
////
////    [image sd_study_setImageWithUR];
//    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
//    imageview.frame = CGRectMake(10, 10, 100, 100);
//    [self.view addSubview:imageview];
//
////
//    [imageview sd_study_setImageWithURL:[NSURL URLWithString:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage001.jpg"] placeholderImage:nil options:0];
    
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    StuWebImageDownloader *downloader = [[StuWebImageDownloader alloc] init];
    [downloader downloadImageWithURL:[NSURL URLWithString:@"https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage001.jpg"] options:StuWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        
    }];
    
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
