//
//  YHEmployeeFinace.m
//  test1
//
//  Created by yinghu on 16/8/29.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import "YHEmployeeFinace.h"

@implementation YHEmployeeFinace
- (void)doAdaysWork {
    
}

+ (YHEmployeeFinace *)shareDefault {
    static YHEmployeeFinace *singleEmployee = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleEmployee = [[YHEmployeeFinace alloc] init];
    });
    
    return singleEmployee;
}
@end
