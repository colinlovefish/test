//
//  YHEmployeeDevelopment.m
//  test1
//
//  Created by yinghu on 16/8/29.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import "YHEmployeeDevelopment.h"
#import <objc/runtime.h>

@interface YHEmployeeDevelopment ()
@property (nonatomic, strong) NSMutableDictionary *backingStore;

@end

@implementation YHEmployeeDevelopment
@dynamic string, number,date,opaqueObject;
- (instancetype)init {
    if (self = [super init]) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}

+ (BOOL) resolveInstanceMethod:(SEL)sel {
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
//        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
        
    }else {
//        class_addMethod(self, sel, (IMP)autoDictionaryGetter, @"@@:");
    }
    
    return YES;
    
}

@end
