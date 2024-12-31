//
//  FYPAppConfigurator.swift
//  FYPUIConfigSDK
//
//  Created by 研发2组 on 2024/12/30.
//

import UIKit

public class FYPAppConfigurator {
    
    /// 配置应用入口
    @MainActor public static func configureApp(window: UIWindow?, with configFileName: String) {
        guard let config = AppConfigLoader.loadConfig(from: configFileName) else {
            fatalError("配置文件 \(configFileName) 加载失败")
        }
        
        // 获取系统当前的外观模式
        let isSystemDarkMode = UITraitCollection.current.userInterfaceStyle == .dark
        
        // 如果系统是暗夜模式，强制应用暗夜模式；否则根据配置文件的 `isDarkMode` 字段决定
        if isSystemDarkMode || config.isDarkMode {
            window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
        
        window?.backgroundColor = UIColor(named: config.appBackgroundMainColor)
        // 初始化 TabBarController
        let tabBarController = FYPBaseTabbarController()
        tabBarController.config = config
        // 初始化 NavigationController 并配置导航栏
        let navigationController = FYPBaseNavigationController(rootViewController: tabBarController)
        navigationController.config = config
        
        // 配置 window
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

