//
//  QYHReqeuest.m
//  test1
//
//  Created by yinghu on 16/7/31.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import "QYHReqeuest.h"
@interface QYHReqeuest()
//@property (nonatomic, copy) NSString *someString;

@end

@implementation QYHReqeuest
{
    NSString *_someString;
}
+ (instancetype)shareInstance {
    static QYHReqeuest *sharedInstance = nil;
    @synchronized (self) {
        if (!sharedInstance) {
            sharedInstance = [[self alloc] init];
        }
    }
    
    return sharedInstance;
}

+ (instancetype)shareQYHRequest {
    static QYHReqeuest *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (NSString *)someString {
    __block NSString *localSomeString;
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        localSomeString = _someString;
    });
    return localSomeString;
}

- (void)setSomeString:(NSString *)someString {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _someString = someString;
    });
}


@end
