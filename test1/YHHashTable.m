//
//  YHHashTable.m
//  test1
//
//  Created by yinghu on 16/8/29.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import "YHHashTable.h"
#import "YHEmployeeDevelopment.h"
#import "YHEmployeeDesigner.h"
#import "YHEmployeeFinace.h"
//typedef struct  {
//    const NXHashTablePrototype *prototype;
//    unsigned count;
//    unsigned nbBuckets;
//    void *buckets;
//    const void *info;
//}NXHashTable;

@implementation YHHashTable

+ (YHHashTable *)emplyeeWithType:(YHEmployeeType )type {
    switch (type) {
        case YHEmployeeTypeDeveloper:
            return [YHEmployeeDevelopment new];
            break;
            
        case YHEmployeeTypeDesigner:
            return [YHEmployeeDesigner new];
            break;
        
        case YHEmployeeTypeFinance:
            return [YHEmployeeFinace new];
            break;
    }
}

- (void)doAdaysWork {
    
}




@end
