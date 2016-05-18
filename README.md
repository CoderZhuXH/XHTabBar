# XHTabBar
* 快速创建自定义TabBar - 支持小红点,数字角标及自定义高度

## 效果
![image](https://raw.githubusercontent.com/CoderZhuXH/XHTabBar/master/DEMO.PNG)

## 使用方法
### 1.在XHTabBar.m initData方法中初始化相关数据
```objc
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
```
### 2.在Appdelegate设置tabbar为根控制器
```objc
XHTabBar *tabBar = [[XHTabBar alloc] init];
self.window.rootViewController = tabBar;
```
### 3.角标及小红点设置,及其他操作

```objc


/**
*  影藏TabBar 调用系统方法
*/

.hidesBottomBarWhenPushed = YES;

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

```

##  安装
### 手动添加:<br>
*   1.将 XHTabBar 文件夹添加到工程目录中<br>
*   2.导入 XHTabBar.h

### CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'XHTabBar'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 XHTabBar.h

##  系统要求
*   该项目最低支持 iOS 7.0 和 Xcode 7.0

##  许可证
XHNetworking 使用 MIT 许可证，详情见 LICENSE 文件