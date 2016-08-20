//
//  UIView+WebCacheoperationStudy.m
//  ThirdLibStudy
//
//  Created by dujia on 16/7/30.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "UIView+WebCacheoperationStudy.h"
#import <objc/runtime.h>

static char loadOperationKey;


@implementation UIView (WebCacheoperationStudy)
- (NSMutableDictionary *)operationDictionary_study
{
    NSMutableDictionary *operations = objc_getAssociatedObject(self, &loadOperationKey);
    if (operations) {
        return operations;
    }
    operations = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, &loadOperationKey, operations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return operations;
}

- (void)sd_study_setImageLoadOperation:(id)operation forKey:(NSString *)key
{
    NSMutableDictionary *operationDictionary = [self operationDictionary_study];
    [operationDictionary setObject:operation forKey:key];
    
    NSLog(@"%@",operationDictionary);
}


- (void) sd_study_cancelImageLoadOperationWithKey:(NSString *)key
{
    NSMutableDictionary *operationDictionary = [self operationDictionary_study];
    id operations = [operationDictionary objectForKey:key];
    if (operations) {
        if ([operations isKindOfClass:[NSArray class]]) {
            
        }
//        else if ([operations conformsToProtocol:@protocol(<#protocol-name#>)])
        [operationDictionary removeObjectForKey:key];
    }
    
}

- (void)sd_study_removeImageLoadOperationWithKey:(NSString *)key
{
    NSMutableDictionary *operationDictionary = [self operationDictionary_study];
    [operationDictionary removeObjectForKey:key];
    NSLog(@"%@",operationDictionary);
}
@end
