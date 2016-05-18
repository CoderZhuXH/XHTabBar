Pod::Spec.new do |s|
  s.name         = "XHTabBar"
  s.version      = "1.0"
  s.summary      = "快速创建自定义TabBar"
  s.homepage     = "https://github.com/CoderZhuXH/XHTabBar"
  s.license      = "MIT"
  s.authors      = { '朱晓辉' => '977950862@qq.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CoderZhuXH/XHTabBar.git", :tag => s.version }
  s.source_files = "XHTabBar/*.{h,m}"
  s.requires_arc = true
end
