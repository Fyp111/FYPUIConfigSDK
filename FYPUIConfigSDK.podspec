Pod::Spec.new do |s|
    s.name         = 'FYPUIConfigSDK'
    s.version      = '1.0' 
    s.summary      = '用数据驱动配置一个 tabbarcontroller  navigationcontroller 的app'
    s.description  = <<-DESC
                     FYPUIConfigSDK is a library that provides ...
                     DESC
    s.homepage     = 'https://github.com/Fyp111/FYPUIConfigSDK'
    s.license      = { :type => 'MIT', :file => 'LICENSE' } 
    s.author       = { 'Fyp111' => '1938467294@qq.com' } 
    s.source       = { :git => 'https://github.com/Fyp111/FYPUIConfigSDK.git', :tag => s.version.to_s }
    s.platform     = :ios, '13.0' 
    s.source_files = 'Package.swift' ,
                     'Sources/FYPUIConfigSDK/AppConfig.swift' ,
                     'Sources/FYPUIConfigSDK/FYPAppConfigurator.swift' ,
                     'Sources/FYPUIConfigSDK/FYPBaseNavigationController.swift' ,
                     'Sources/FYPUIConfigSDK/FYPBaseTabbarController.swift' ,
                     'Sources/FYPUIConfigSDK/FYPBaseViewController.swift' ,
                     'Sources/FYPUIConfigSDK/FYPUIConfigSDK.swift'
    s.swift_version = '5.0' 

  end