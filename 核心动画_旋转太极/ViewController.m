//
//  ViewController.m
//  核心动画_旋转太极
//
//  Created by HelloYeah on 16/3/17.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "ViewController.h"
#import "TaiJi.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加太极视图
    TaiJi * taiji = [[TaiJi alloc]init];
    taiji.frame = CGRectMake(100, 200, 200, 200);
    [self.view addSubview:taiji];
    
    //添加动画
    [self addAnimationTo:taiji];
}


- (void)addAnimationTo:(UIView *)view
{
    //基础动画
    CABasicAnimation * anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.fromValue = @(M_PI);
    anim.toValue = @(- M_PI);
    anim.duration = 2.0;
    anim.repeatCount = CGFLOAT_MAX;
    
    [view.layer addAnimation:anim forKey:nil];
}


@end
