# FYPUIConfigSDK.podspec
Pod::Spec.new do |s|
    s.name         = 'FYPUIConfigSDK'
    s.version      = '1.0' # 使用适当的版本号
    s.summary      = '用数据驱动配置一个 tabbarcontroller  navigationcontroller 的app'
    s.description  = <<-DESC
                     FYPUIConfigSDK is a library that provides ...
                     DESC
    s.homepage     = 'https://github.com/Fyp111/FYPUIConfigSDK'
    s.license      = { :type => 'MIT', :file => 'LICENSE' } # 使用适当的许可证类型，并确保有一个 LICENSE 文件
    s.author       = { 'Your Name' => '1938467294@qq.com' } # 替换为你的信息
    s.source       = { :git => 'https://github.com/Fyp111/FYPUIConfigSDK.git', :tag => s.version.to_s }
    s.platform     = :ios, '10.0' # 替换为支持的最低 iOS 版本
    s.source_files = 'FYPUIConfigSDK/Package.swift' ,
                     'FYPUIConfigSDK/Sources/FYPUIConfigSDK/AppConfig.swift' ,
                     'FYPUIConfigSDK/Sources/FYPUIConfigSDK/FYPAppConfigurator.swift' ,
                     'FYPUIConfigSDK/Sources/FYPUIConfigSDK/FYPBaseNavigationController.swift' ,
                     'FYPUIConfigSDK/Sources/FYPUIConfigSDK/FYPBaseTabbarController.swift' ,
                     'FYPUIConfigSDK/Sources/FYPUIConfigSDK/FYPBaseViewController.swift' ,
                     'FYPUIConfigSDK/Sources/FYPUIConfigSDK/FYPUIConfigSDK.swift'
    s.swift_version = '5.0' # 替换为支持的 Swift 版本
    # 添加任何依赖项
    # s.dependency 'SomeOtherPod', '~> 1.0'
  end