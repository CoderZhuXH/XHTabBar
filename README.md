# XHTabBar
* 快速创建自定义TabBar

## 效果
![image](https://raw.githubusercontent.com/CoderZhuXH/XHTabBar/master/DEMO.PNG)

## 使用方法
## 1.在XHTabBar.m initData方法中初始化相关数据
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
## 2.在Appdelegate 中调用
* 2.1设置tabbar为根控制器
```objc
XHTabBar *tabBar = [[XHTabBar alloc] init];
self.window.rootViewController = tabBar;
```
* 2.2设置数字角标
```objc
-(void)showBadgeMark:(NSInteger)badge index:(NSInteger)index;
```
* 2.3设置小红点
```objc
-(void)showPointMarkIndex:(NSInteger)index;
```
* 2.4不显示角标
```objc
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