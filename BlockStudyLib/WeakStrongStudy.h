//
//  WeakStrongStudy.h
//  ThirdLibStudy
//
//  Created by dujia on 16/9/11.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Study)();
typedef void(^StudyName)(NSString *name);
@interface WeakStrongStudy : NSObject
@property (copy , nonatomic) NSString *name;
@property (copy , nonatomic) Study study;
@property (copy , nonatomic) StudyName studyname;
@end
