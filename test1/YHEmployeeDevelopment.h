//
//  YHEmployeeDevelopment.h
//  test1
//
//  Created by yinghu on 16/8/29.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import "YHHashTable.h"

@interface YHEmployeeDevelopment : YHHashTable
@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) id opaqueObject;
@end
