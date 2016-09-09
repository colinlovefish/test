//
//  ThreeView.m
//  test1
//
//  Created by yinghu on 16/8/4.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import "ThreeView.h"

@implementation ThreeView

- (void)drawRect:(CGRect)rect {
 
//    [self drawCircle];
//    [self drawBlueCircle];
}

//椭圆

- (void)drawCircle {
    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 64, 100, 100)];
    [[UIColor redColor] setFill];
    [p fill];
}

/**
 *  使用Core Graphics绘制蓝色圆
 *
 */

- (void)drawBlueCircle {
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(con, CGRectMake(30, 90, 50, 50));
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    CGContextFillPath(con);
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    UIGraphicsPushContext(ctx);
    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 60, 100, 100)];
    [[UIColor blueColor] setFill];
    [p fill];
    UIGraphicsPopContext();
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
