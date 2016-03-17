//
//  TaiJi.m
//  核心动画_旋转太极
//
//  Created by HelloYeah on 16/3/17.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "TaiJi.h"

@implementation TaiJi


//布局子控件
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //拿到宽高中较短的
    CGFloat min = (self.frame.size.width < self.frame.size.height)?self.frame.size.width:self.frame.size.height;
    
    //绘制太极图
    [self drawImage:CGSizeMake(min, min)];
    
}

//绘制太极图
- (void)drawImage:(CGSize)size{
    
    float mid = size.width/2;
    
    //1.开启图像上下文
    UIGraphicsBeginImageContext(size);

    //2.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //3.绘图
        //3.1 绘制黑色的半边
    CGContextAddArc(ctx, mid, mid, mid, - M_PI_2, M_PI_2, 0);
    CGContextAddArc(ctx, mid, mid + 0.5 * mid, mid * 0.5, M_PI_2, -M_PI_2, 1);
    CGContextAddArc(ctx, mid, 0.5 * mid, mid * 0.5, M_PI_2, -M_PI_2, 0);
    [[UIColor blackColor]set];
    CGContextFillPath(ctx);
        //3.2绘制白色的半边
    CGContextAddArc(ctx, mid, mid, mid, - M_PI_2, M_PI_2, 1);
    CGContextAddArc(ctx, mid, mid + 0.5 * mid, mid * 0.5, M_PI_2, -M_PI_2, 1);
    CGContextAddArc(ctx, mid, 0.5 * mid, mid * 0.5, M_PI_2, -M_PI_2, 0);
    [[UIColor whiteColor]set];
    CGContextFillPath(ctx);
    
        //3.3绘制白色的小圆
    CGContextAddArc(ctx, mid, 0.5 * mid, 0.2 * mid, M_PI,- M_PI , 1);
    CGContextFillPath(ctx);
        //3.4绘制黑色的小圆
    CGContextAddArc(ctx, mid, 1.5 * mid, 0.2 * mid, M_PI,- M_PI , 1);
    [[UIColor blackColor]set];
    CGContextFillPath(ctx);

    //4.获取生成的图片
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    //5.显示生成的图片到imageview
    self.backgroundColor = [UIColor colorWithPatternImage:image];
    UIGraphicsEndImageContext();

}


@end
