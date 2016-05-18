//
//  XHTabBar.m
//  XHTabBarExample
//
//  Created by xiaohui on 15-4-8.
//  Copyright © 2015年 qiantou. All rights reserved.
//  https://github.com/CoderZhuXH/XHTabBar

#import "XHTabBar.h"

//RGB颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
//title默认颜色
#define TitleColor   [UIColor grayColor]
//title选中颜色
#define TitleColor_Sel  RGBCOLOR(41, 167, 245)
//title字体大小
#define TitleFontSize 12.0

//数字角标直径
#define NumMark_W_H 20
//小红点直径
#define PointMark_W_H 12


//TabBarButton 中 图片与文字所占比
static const float scale=0.55;

#pragma mark-@interface XHTabBarButton
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

#pragma mark-@interface XHTabBar
@interface XHTabBar ()
@property(nonatomic,strong)UIButton *seleBtn;
@property(nonatomic,strong)UIView *tabBarView;
@property(nonatomic,assign)NSInteger tabBarHeight;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSArray *imageArr;
@property(nonatomic,strong)NSArray *selImageArr;
@property(nonatomic,strong)NSArray *classArr;
@end
@implementation XHTabBar
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self initTabBar];
    }
    return self;
}
#pragma mark-初始化TabBar数据
-(void)initData
{
    //title数组
    self.titleArr = @[@"首页",@"消息",@"朋友",@"我的"];
    //默认图片数组
    self.imageArr= @[@"home_tabbar",@"msg_tabbar",@"friend_tabbar",@"me_tabbar"];
    //选中图片数组
    self.selImageArr = @[@"home_tabbar_sel",@"msg_tabbar_sel",@"friend_tabbar_sel",@"me_tabbar_sel"];
    //控制器数组
    self.classArr = @[@"MainVC",@"MsgVC",@"FriendVC",@"MeVC"];
    //tabBar高度
    self.tabBarHeight = 49.0;
    
}
-(void)initTabBar{
    
    //初始化数据
    [self initData];
    //创建VC
    [self createControllerByClassArray:self.classArr];
    //创建tabBarView
    [self createTabBarView];
    //设置TabbarLine
    [self setTabBarLine];
}

-(void)createControllerByClassArray:(NSArray *)classArray
{
    if(classArray.count==0) NSLog(@"控制器数组为nil,请初始化");
    NSMutableArray *tabBarArr = [[NSMutableArray alloc]init];
    for (NSString *className in classArray) {
        Class class = NSClassFromString(className);
        UIViewController *viewcontroller = [[class alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewcontroller];
        [tabBarArr addObject:nav];
        
    }
    self.viewControllers = tabBarArr;
}
-(void)setTabBarLine
{
    if (self.tabBarHeight>49.0)
    {
        [self.tabBar setShadowImage:[[UIImage alloc] init]];
        [self.tabBar setBackgroundImage:[[UIImage alloc] init]];
        
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self.tabBarView addSubview:lineLabel];
    }
}
-(void)createTabBarView
{
    if(!self.tabBarHeight) self.tabBarHeight=49.0;
    
    for(UIView *view in self.tabBar.subviews)
    {
        [view removeFromSuperview];
    }
    self.tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0,49.0-self.tabBarHeight,[UIScreen mainScreen].bounds.size.width,self.tabBarHeight)];
    [self.tabBar addSubview:self.tabBarView];
    
    if(self.selImageArr.count==0) NSLog(@"选中图片数组为nil,请初始化");
    if(self.imageArr.count==0) NSLog(@"图片数组为nil,请初始化");
    if(self.titleArr.count==0) NSLog(@"title数组为nil,请初始化");
        
    int num = (int)self.classArr.count;
    for(int i=0;i<num;i++)
    {
        XHTabBarButton *button = [[XHTabBarButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/num*i, 0, [UIScreen mainScreen].bounds.size.width/num,self.tabBarHeight)];
        button.tag = 1000+i;
        
        //常态文字颜色
        [button setTitleColor:TitleColor forState:UIControlStateNormal];
        //选中文字颜色
        [button setTitleColor:TitleColor_Sel forState:UIControlStateSelected];
        
        button.titleLabel.font = [UIFont systemFontOfSize:TitleFontSize];
        button.backgroundColor = [UIColor whiteColor];
        [button setImage:[UIImage imageNamed:self.imageArr[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:self.selImageArr[i]] forState:UIControlStateSelected];
        [button setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBarView  addSubview:button];
        if (i==0)
        {
            //默认选中
            button.selected=YES;
            self.seleBtn = button;
        }
        //角标
        UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(button.frame.size.width/2.0+6, 3, NumMark_W_H, NumMark_W_H)];
        numLabel.layer.masksToBounds = YES;
        numLabel.layer.cornerRadius = 10;
        numLabel.backgroundColor = [UIColor redColor];
        numLabel.textColor = [UIColor whiteColor];
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.font = [UIFont systemFontOfSize:13];
        numLabel.tag = 1010+i;
        numLabel.hidden = YES;
        [button addSubview:numLabel];
    }
}
-(void)buttonAction:(UIButton *)button{
    
    NSInteger index = button.tag-1000;
    
    [self showControllerIndex:index];
    
}

/**
 *  切换显示控制器
 *
 *  @param index 位置
 */
-(void)showControllerIndex:(NSInteger)index
{
    self.seleBtn.selected = NO;
    UIButton *button = (UIButton *)[self.tabBarView viewWithTag:1000+index];
    button.selected = YES;
    self.seleBtn = button;
    self.selectedIndex=index;
}
/**
 *  数字角标
 *
 *  @param num   所要显示数字
 *  @param index 位置
 */
-(void)showBadgeMark:(NSInteger)badge index:(NSInteger)index
{
    UILabel *numLabel = (UILabel *)[self.tabBarView viewWithTag:1010+index];
    numLabel.hidden=NO;
    CGRect nFrame = numLabel.frame;
    if(badge<=0)
    {
        //隐藏角标
        [self hideMarkIndex:index];
    }
    else
    {
        if(badge>0&badge<=9)
        {
            nFrame.size.width = NumMark_W_H;
        }
        else if (badge>9&badge<=19)
        {
            nFrame.size.width = NumMark_W_H+5;
        }
        else
        {
            nFrame.size.width = NumMark_W_H+10;
        }
        nFrame.size.height = NumMark_W_H;
        numLabel.frame = nFrame;
        numLabel.layer.cornerRadius = NumMark_W_H/2.0;
        numLabel.text = [NSString stringWithFormat:@"%ld",badge];
        if(badge>99)
        {
            numLabel.text =@"99+";
        }
    }
}

/**
 *  小红点
 *
 *  @param index 位置
 */
-(void)showPointMarkIndex:(NSInteger)index
{
    UILabel *numLabel = (UILabel *)[self.tabBarView viewWithTag:1010+index];
    numLabel.hidden=NO;
    CGRect nFrame = numLabel.frame;
    nFrame.size.height=PointMark_W_H;
    nFrame.size.width = PointMark_W_H;
    numLabel.frame = nFrame;
    numLabel.layer.cornerRadius = PointMark_W_H/2.0;
    numLabel.text = @"";
}

/**
 *  影藏指定位置角标
 *
 *  @param index 位置
 */
-(void)hideMarkIndex:(NSInteger)index
{
    UILabel *numLabel = (UILabel *)[self.tabBarView viewWithTag:1010+index];
    numLabel.hidden = YES;
}
@end
