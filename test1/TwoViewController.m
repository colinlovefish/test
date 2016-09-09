//
//  TwoViewController.m
//  test1
//
//  Created by yinghu on 16/8/3.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoView.h"

@interface TwoViewController ()
@property (nonatomic, copy) NSString *lastName;
@end


static NSString *const KVO_CONTEXT_ADDRESS_CHANGED = @"KVO_CONTEXT_CHANGED";
@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = [UIColor whiteColor];
    TwoView *twoView = [[TwoView alloc] init];
    twoView.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:twoView];
//    self.lastName = @"hello";
    [self setValue:@"yinghu" forKey:@"lastName"];
    NSLog(@"%@",self.lastName);
    [self addObserver:self forKeyPath:@"lastName" options:0 context:(__bridge void * _Nullable)(KVO_CONTEXT_ADDRESS_CHANGED)];
   self.lastName = @"hello";
//    int i = 1;
//    double j = 1;

    NSMutableArray *mutableObjects = [NSMutableArray mutableCopy] ?: [NSMutableArray array];
    NSArray *array = @[@"John Appleseed",@"Tim Cook"];
    NSArray *sortArray = [array sortedArrayUsingSelector:@selector(localizedCompare:)];
//    NSArray *sort2 = [array sortedArrayUsingFunction:(nonnull NSInteger (*)(id  _Nonnull __strong, id  _Nonnull __strong, void * _Nullable)) context:(nullable void *)];
    NSLog(@"twoView的hash值:%ld  lastNameHash:%ld  ",twoView.hash,_lastName.hash);
    
    
 
    NSMutableSet *set = [NSMutableSet new];
    NSMutableArray *arrayA = [@[@1,@2] mutableCopy];
    [set addObject:arrayA];
    
    NSLog(@"set = %@", set);
    
    NSMutableArray *arrayB = [@[@1,@2] mutableCopy];
    [set addObject:arrayB];
    NSLog(@"set = %@", set);
    
    NSMutableArray *arrayC = [@[@1] mutableCopy];
    [set addObject:arrayC];
    [arrayC addObject:@2];
    NSLog(@"set = %@", set);
    
    NSSet *setB = [set copy];
    NSLog(@"setB = %@",setB);
    
    
    Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method swappedMethod = class_getInstanceMethod([NSString class], @selector(yh_myLowercaseString));
    method_exchangeImplementations(originalMethod, swappedMethod);
    
    
    
    NSLog(@"方法交换，小写：%@",self.lastName.lowercaseString);

    // Do any additional setup after loading the view.
}

- (NSString *)yh_myLowercaseString {
    NSString *lowercase = [self yh_myLowercaseString];
    NSLog(@"%@ => %@",self, lowercase);
    return lowercase;
}


- (BOOL)isEqual:(id)object {
    if (self == object)  return YES;
    
    if ([self class] != [object class]) return NO;
    
   

    return YES;
    
}

- (NSUInteger)hash {
    return 1111;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context == (__bridge void * _Nullable)(KVO_CONTEXT_ADDRESS_CHANGED)) {
        NSString *name = [object valueForKey:@"lastName"];
        
        NSLog(@"has new name:%@",name);
    }
}


//- (void)setLastName:(NSString *)lastName {
//    if (![lastName isEqualToString:@"Smith"]) {
//        [NSException raise:NSInvalidArgumentException format:@"Last name must be Smith"];
//    }
//    self.lastName = lastName;
//}

- (void)drawPicture {
 
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 20, 30);
    CGContextAddLineToPoint(ctx, 200, 300);
    CGContextStrokePath(ctx);
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"lastName"];
}

- (void)drawRect:(CGRect)rect {
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    [[UIColor grayColor] set];
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 20, 20);
//
//    CGPathAddLineToPoint(path, NULL, 200, 300);
//    CGContextAddPath(ctx, path);
//    
//    CGMutablePathRef path1 = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path1, NULL, CGRectMake(50, 50, 100, 100));
//    [[UIColor greenColor] set];
//    CGContextAddPath(ctx, path1);
//    
//    CGContextStrokePath(ctx);
//    CGPathRelease(path1);
//    CGPathRelease(path);
    
    
    
//    // 1.获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    // --------------------------实心圆
//    
//    // 2.画图
//    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 50, 50));
//    [[UIColor greenColor] set];
//    
//    // 3.渲染
//    CGContextFillPath(ctx);
//    
//    
//    
//    // --------------------------空心圆
//    
//    CGContextAddEllipseInRect(ctx, CGRectMake(70, 10, 50, 50));
//    [[UIColor redColor] set];
//    CGContextStrokePath(ctx);
//    
//    
//    
//    // --------------------------椭圆
//    //画椭圆和画圆方法一样，椭圆只是设置不同的长宽
//    CGContextAddEllipseInRect(ctx, CGRectMake(130, 10, 100, 50));
//    [[UIColor purpleColor] set];
//    CGContextFillPath(ctx);
//    
//    
//    
//    // --------------------------直线
//    CGContextMoveToPoint(ctx, 20, 80); // 起点
//    CGContextAddLineToPoint(ctx, self.view.frame.size.width-10, 80); //终点
//    //    CGContextSetRGBStrokeColor(ctx, 0, 1.0, 0, 1.0); // 颜色
//    [[UIColor redColor] set]; // 两种设置颜色的方式都可以
//    CGContextSetLineWidth(ctx, 2.0f); // 线的宽度
//    CGContextSetLineCap(ctx, kCGLineCapRound); // 起点和重点圆角
//    CGContextSetLineJoin(ctx, kCGLineJoinRound); // 转角圆角
//    CGContextStrokePath(ctx); // 渲染（直线只能绘制空心的，不能调用CGContextFillPath(ctx);）
//    
//    
//    
//    // --------------------------三角形
//    CGContextMoveToPoint(ctx, 10, 150); // 第一个点
//    CGContextAddLineToPoint(ctx, 60, 100); // 第二个点
//    CGContextAddLineToPoint(ctx, 100, 150); // 第三个点
//    [[UIColor purpleColor] set];
//    CGContextClosePath(ctx);
//    CGContextStrokePath(ctx);
//    
//    
//    
//    // --------------------------矩形
//    CGContextAddRect(ctx, CGRectMake(20, 170, 100, 50));
//    [[UIColor orangeColor] set];
//    //    CGContextStrokePath(ctx); // 空心
//    CGContextFillPath(ctx);
//    
//    
//    
//    // --------------------------圆弧
//    CGContextAddArc(ctx, 200, 170, 50, M_PI, M_PI_4, 0);
//    CGContextClosePath(ctx);
//    CGContextFillPath(ctx);
//    
//    
//    // --------------------------文字
//    NSString *str = @"你在红楼，我在西游";
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSForegroundColorAttributeName] = [UIColor whiteColor]; // 文字颜色
//    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14]; // 字体
//    
//    [str drawInRect:CGRectMake(20, 250, 300, 30) withAttributes:dict];
//    
//    
//    // --------------------------图片
//    UIImage *img = [UIImage imageNamed:@"yingmu"];
//    //    [img drawAsPatternInRect:CGRectMake(20, 280, 300, 300)]; // 多个平铺
//    //    [img drawAtPoint:CGPointMake(20, 280)]; // 绘制到指定点，图片有多大就显示多大
//    [img drawInRect:CGRectMake(20, 280, 80, 80)]; // 拉伸
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
