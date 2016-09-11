//
//  BlockStudyLib.m
//  BlockStudyLib
//
//  Created by dujia on 16/9/4.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "BlockStudyLib.h"
#import "WeakStrongStudy.h"


int global_i = 1;
static int static_global_j = 2;

typedef void(^BlockMallock1)();

@interface BlockStudyLib()
@property (nonatomic , copy) BlockMallock1 block1;
@property (nonatomic , copy) NSString *name;
@property (nonatomic , strong) WeakStrongStudy *weakStrongStudy;
@end


@implementation BlockStudyLib

- (id) init
{
    if (self = [super init]) {
        
        
        
        
    }
    return self;
}
- (void) startMethod
{
    WeakStrongStudy *study = [[WeakStrongStudy alloc] init];
    study.name = @"hello world";

    __weak typeof(study) weakSelf = study;
    
    study.study = ^{
        __strong typeof(study) strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"my name is = %@",strongSelf.name);
        });
        
    };
    study.study();

//    study.studyname = ^(NSString *name){
//        NSLog(@"studyname = %@",name);
//    };
//    study.studyname(study.name);
    
}


+ (void) startBlock
{
    __block int i = 8;
    NSLog(@"%p",&i);
    
    void (^myBlock)(void) = ^{
        i++;
        NSLog(@"block %p",&i);
    };
    NSLog(@"%@",myBlock);
    myBlock();
    
    __block int temp = 10;
    NSLog(@"%@",^{NSLog(@"*********%d      %p",temp++ , &temp);});
}



@end
