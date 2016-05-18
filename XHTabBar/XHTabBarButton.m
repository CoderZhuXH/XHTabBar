//
//  XHTabBarButton.m
//  XHTabBarExample
//
//  Created by xiaohui on 15-4-8.
//  Copyright © 2015年 qiantou. All rights reserved.
//

#import "XHTabBarButton.h"

/**
 *  button 中 图片与文字所占比
 */
static const float scale=0.55;


@interface XHTabBarButton()

@end

@implementation XHTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }

    return self;
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat newX = 0;
    CGFloat newY =5;
    CGFloat newWidth = contentRect.size.width;
    CGFloat newHeight = contentRect.size.height*scale-newY;
    return CGRectMake(newX, newY, newWidth, newHeight);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect{

    CGFloat newX = 0;
    CGFloat newY = contentRect.size.height*scale;
    CGFloat newWidth = contentRect.size.width;
    CGFloat newHeight = contentRect.size.height-contentRect.size.height*scale;
    return CGRectMake(newX, newY, newWidth, newHeight);
}
@end
