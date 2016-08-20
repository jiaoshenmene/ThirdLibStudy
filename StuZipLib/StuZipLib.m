//
//  StuZipLib.m
//  StuZipLib
//
//  Created by dujia on 16/8/3.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "StuZipLib.h"


@interface StuZipLib()

@property (nonatomic , strong) UIImageView *imageview;

@end

@implementation StuZipLib

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    UIEdgeInsets edge = UIEdgeInsetsMake(10, 10, 10, 10);
    
    UIImage *image = [UIImage imageNamed:@"longpressview_focus"];
    [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeTile];
    
    
    _imageview = [[UIImageView alloc] initWithImage:image];
    
    _imageview.frame = CGRectMake(10, 10, 100, 100);
    [self.view addSubview:_imageview];
}

@end
