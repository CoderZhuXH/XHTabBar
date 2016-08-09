# XHTabBar
#### 快速创建自定义TabBar,支持小红点,数字角标及自定义高度<br>
####[Swift版请戳这里>>>](https://github.com/CoderZhuXH/XHTabBarSwift)
###技术交流群(群号:537476189).
## 效果
![image](https://raw.githubusercontent.com/CoderZhuXH/XHTabBar/master/DEMO.PNG)

## 使用方法
### 1.在Appdelegate 中初始化,并设置为根控制器
```objc
    //控制器数组
    NSArray *controllerArray = @[@"MainVC",@"MsgVC",@"FriendVC",@"MeVC"];
    //title数组
    NSArray * titleArray = @[@"首页",@"消息",@"朋友",@"我的"];
    //默认图片数组
    NSArray *imageArray= @[@"home_tabbar",@"msg_tabbar",@"friend_tabbar",@"me_tabbar"];
    //选中图片数组
    NSArray *selImageArray = @[@"home_tabbar_sel",@"msg_tabbar_sel",@"friend_tabbar_sel",@"me_tabbar_sel"];
    //tabBar高度
    CGFloat tabBarHeight = 49.0;
    
    //初始化(height:最小高度为49.0,当传nil 或<49.0时均按49.0处理)
    XHTabBar *tabbar = [[XHTabBar alloc] initWithControllerArray:controllerArray titleArray:titleArray imageArray:imageArray selImageArray:selImageArray height:tabBarHeight];

    //设置为根控制器
    self.window.rootViewController = tabbar;
```
### 2.影藏tabBar
```objc
   //push界面时,若需影藏tabBar,调用系统方法设置影藏即可,如下
    MsgVC *VC = [[MsgVC alloc] init];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
```
### 3.角标、小红点及其他设置接口
```objc
/**
*  设置tabBar显示指定控制器
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
```
### 4.定义tabbar文字大小,颜色,请在XHTabBar.m 顶部修改下面宏定义
```objc
//RGB颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
//title默认颜色
#define TitleColor   [UIColor grayColor]
//title选中颜色
#define TitleColor_Sel  RGBCOLOR(41, 167, 245)
//title字体大小
#define TitleFontSize 12.0
//TabBar背景色
#define TabBarBackgroundColor [UIColor whiteColor]

//数字角标直径
#define NumMark_W_H 20
//小红点直径
#define PointMark_W_H 12
```
##  安装
### 手动添加:<br>
*   1.将 XHTabBar 文件夹添加到工程目录中<br>
*   2.导入 XHTabBar.h

### CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'XHTabBar'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 XHTabBar.h

### 如果你发现你执行`pod install`后,导入的不是最新的,请删除`Podfile.lock`文件,在执行一次 `pod install` 

##  系统要求
*   该项目最低支持 iOS 7.0 和 Xcode 7.0

##  许可证
	XHTabBar 使用 MIT 许可证，详情见 LICENSE 文件