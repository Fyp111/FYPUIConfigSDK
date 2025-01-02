Pod::Spec.new do |s|
    s.name         = 'FYPUIConfigSDK'
    s.version      = '1.0' 
    s.summary      = ' tabbarcontroller  navigationcontroller app'
    s.description  = <<-DESC
                     tabbarcontroller  navigationcontroller app
                     DESC
    s.homepage     = 'https://github.com/Fyp111/FYPUIConfigSDK'
    s.license      = { :type => 'MIT', :file => 'LICENSE' } 
    s.author       = { 'Fyp111' => '1938467294@qq.com' } 
    s.source       = { :git => 'https://github.com/Fyp111/FYPUIConfigSDK.git', :tag => s.version.to_s }
    s.platform     = :ios, '13.0' 
    s.source_files = 'Sources/FYPUIConfigSDK/{*}.swift' 
    s.swift_version = '5.0' 

  end