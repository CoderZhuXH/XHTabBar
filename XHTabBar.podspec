Pod::Spec.new do |s|
  s.name         = "XHTabBar"
  s.version      = "1.5.1"
  s.summary      = "快速创建自定义TabBar,支持小红点,数字角标及自定义高度"
  s.homepage     = "https://github.com/CoderZhuXH/XHTabBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Zhu Xiaohui" => "977950862@qq.com"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CoderZhuXH/XHTabBar.git", :tag => s.version }
  s.source_files = "XHTabBar", "*.{h,m}"
  s.requires_arc = true
end
