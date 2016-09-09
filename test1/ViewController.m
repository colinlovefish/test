//
//  ViewController.m
//  test1
//
//  Created by yinghu on 16/7/28.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "TwoViewController.h"
#import "ThreeViewController.h"

#define AlertKey @"uialert"


@interface ViewController ()<UIAlertViewDelegate>
@property (nonatomic, copy)NSString *str;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, getter = isOn) BOOL on;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width / 2 - 50, [[UIScreen mainScreen]bounds].size.height / 2 - 200, 100, 50);
    [button setTitle:@"弹框重写" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(handleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width / 2 - 50, [[UIScreen mainScreen]bounds].size.height / 2 - 100, 100, 50);
    [button1 setTitle:@"方法交换" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(handleButtonClick2:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width / 2 - 50, [[UIScreen mainScreen]bounds].size.height / 2 , 100, 50);
    [button2 setTitle:@"按钮三" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(handleButtonClick3:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:_tableView];
    
    [self.tableView removeFromSuperview];
    _tableView = nil;
    
    if (self.tableView) {
        NSLog(@"存在");
    }else {
        NSLog(@"不存在");
    }
    

    NSString *test = @"2.0";

    // Do any additional setup after loading the view, typically from a nib.
}

/**
 *  方法交换
 *
 *  @param sender
 */
- (void)handleButtonClick2:(UIButton *)sender {
    Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method swappedMethod = class_getInstanceMethod([NSString class], @selector(uppercaseString));
    method_exchangeImplementations(originalMethod, swappedMethod);
    
    NSLog(@"%@",[@"nihao" lowercaseString]);
    
    
}

- (void)handleButtonClick {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"测试" message:@"你好" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    void (^block)(NSInteger) = ^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [self doCancel];
        } else {
            [self doConfirm];
        }
    };
    objc_setAssociatedObject(alert, AlertKey, block, OBJC_ASSOCIATION_COPY);
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    void (^block)(NSInteger) = objc_getAssociatedObject(alertView, AlertKey);
    block(buttonIndex);
}

- (void)doCancel{
    NSLog(@"cancel");
    
//    NSMutableArray *A = @[@31,@41,@59,@26,@42,@58].mutableCopy;
    NSMutableArray *A = [NSMutableArray arrayWithObjects:@31,@41,@59,@26,@42,@58, nil];
    id key = 0;
    
    for (int j = 1; j < A.count; j++) {
        key = A[j];
        
        int i = j - 1;
        while (i >= 0 && A[i] <
               
               key) {
            A[i + 1] = A[i];
            i = i - 1;
            A[i + 1] = key;
        }
        
    }
    
    NSLog(@"%@,%lf",A,10 * kAnimationDuration);
    
    
    
    
}


- (void)doConfirm{
    NSLog(@"confirm");
    NSArray *arr = @[@1,@2,@3];
    CFArrayRef aCFArray = (__bridge CFArrayRef)arr;
    NSLog(@"size of array = %li",CFArrayGetCount(aCFArray));
    CFArrayRef arr1 = ((__bridge_retained CFArrayRef)arr);
    
    NSLog(@"size = %@",arr1);
    
    TwoViewController *two = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:two animated:YES];
    
   
}


- (void)handleButtonClick3:(UIButton *)sender {
    NSLog(@"类对象查找");
    
//    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
//    [self.navigationController pushViewController:threeVC animated:YES];
    NSString *className = @"ThreeViewController";
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = @"第三个页面";
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    
    NSArray *arr = @[@"nihao",@"hello"];
    for (id obj in arr) {
        if ([obj isKindOfClass:[UIButton class]]) {
            NSLog(@"1 %@",[UIButton class]);
        }else if ([obj isKindOfClass:[NSArray class]]) {
            NSLog(@"2 %@",[NSArray class]);
        }else if ([obj isKindOfClass:[NSString class]]) {
            NSLog(@"3%@",obj);
        }
    }
    _str = @"xiugg";
    NSLog(@"第一次:%@",_str);
    ViewController *vc = [[ViewController alloc] init];
    [vc setValue:@"你好" forKey:@"str"];

    NSLog(@"第二次:%@",self.str);
    
    [_str enumerateLinesUsingBlock:^(NSString * _Nonnull line, BOOL * _Nonnull stop) {
        NSLog(@"----%@",line);
    }];
    
    
    dispatch_queue_t queueA = dispatch_queue_create("com.effectiveobjective.queueA", NULL);
    dispatch_queue_t queueB = dispatch_queue_create("com.effectiveobjective.queueB", NULL);
    dispatch_sync(queueA, ^{
        dispatch_sync(queueB, ^{
            NSLog(@"线程B");
//            dispatch_sync(queueA, ^{
//                NSLog(@"线程A");
//            });
            //使用 dispatch_get_current_queue检测线程
//            dispatch_block_t block = ^{NSLog(@"执行block");};
//            if (dispatch_get_current_queue() == queueA) {
//                NSLog(@"queueA");
//                block();
//            }else {
//                dispatch_sync(queueA, block);
//            }
        });
    });
    
    @try {
        
        ViewController *obj = [[ViewController alloc] init];
        
    }
    @catch (...) {
        NSLog(@"捕获异常");
    }
    @finally {
      
    }
    
    
    
    
    
}


- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@--%@--%@",[self class],self,_str];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
