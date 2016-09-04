//
//  BlockStudyLib.m
//  BlockStudyLib
//
//  Created by dujia on 16/9/4.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "BlockStudyLib.h"


int global_i = 1;
static int static_global_j = 2;

typedef void(^BlockMallock1)();

@interface BlockStudyLib()
@property (nonatomic , copy) BlockMallock1 block1;

@end


@implementation BlockStudyLib

- (id) init
{
    if (self = [super init]) {
        
        
        
        
    }
    return self;
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
