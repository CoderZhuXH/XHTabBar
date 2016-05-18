//
//  XHTabBar.h
//  XHTabBarExample
//
//  Created by xiaohui on 15-4-8.
//  Copyright © 2015年 qiantou. All rights reserved.
//  https://github.com/CoderZhuXH/XHTabBar

#import <UIKit/UIKit.h>


@interface XHTabBarButton : UIButton

@end

@interface XHTabBar : UITabBarController

/*
 影藏TabBar 调用系统方法
 VC.hidesBottomBarWhenPushed = YES;
 */

/**
 *  显示指定控制器
 *
 *  @param index 位置
 */
-(void)showControllerIndex:(NSInteger)index;

/**
 *  数字角标
 *
 *  @param num   所要显示数字
 *  @param index 位置
 */
-(void)showBadgeMark:(NSInteger)badge index:(NSInteger)index;

/**
 *  小红点
 *
 *  @param index 位置
 */
-(void)showPointMarkIndex:(NSInteger)index;

/**
 *  影藏指定位置角标
 *
 *  @param index 位置
 */
-(void)hideMarkIndex:(NSInteger)index;

@end
