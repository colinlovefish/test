//
//  YHHashTable.h
//  test1
//
//  Created by yinghu on 16/8/29.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YHEmployeeType) {
    YHEmployeeTypeDeveloper,
    YHEmployeeTypeDesigner,
    YHEmployeeTypeFinance,
};
@interface YHHashTable : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger salary;

+ (YHHashTable *)emplyeeWithType:(YHEmployeeType )type;
- (void)doAdaysWork;

@end
