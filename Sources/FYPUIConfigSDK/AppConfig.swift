import UIKit
import Foundation

public struct AppConfig: Codable {
    public let isDarkMode: Bool
    public let icon: String
    public let appName: String
    public let appVersion: String
    public let appFont: String
    public let appFontSize: Int
    public let appBackgroundMainColor: String
    public let appBackgroundSubColor: String
    public let appTabbarBackground: String
    public let appTabbarSelectedColor: String
    public let appTabbarUnSelectedColor: String
    public let appTabbarFontSize: Int
    public let appTabbarBackgroundImage: String
    public let appTabbarTransparent: Bool
    public let navigation: NavigationConfig
    public let tabbar: [TabBarItem]
    
    public init(isDarkMode: Bool, icon: String, appName: String, appVersion: String, appFont: String, appFontSize: Int, appBackgroundMainColor: String, appBackgroundSubColor: String, appTabbarBackground: String, appTabbarSelectedColor: String, appTabbarUnSelectedColor: String, appTabbarFontSize: Int,appTabbarBackgroundImage: String,appTabbarTransparent: Bool, navigation: NavigationConfig, tabbar: [TabBarItem]) {
        self.isDarkMode = isDarkMode
        self.icon = icon
        self.appName = appName
        self.appVersion = appVersion
        self.appFont = appFont
        self.appFontSize = appFontSize
        self.appBackgroundMainColor = appBackgroundMainColor
        self.appBackgroundSubColor = appBackgroundSubColor
        self.appTabbarBackground = appTabbarBackground
        self.appTabbarSelectedColor = appTabbarSelectedColor
        self.appTabbarUnSelectedColor = appTabbarUnSelectedColor
        self.appTabbarFontSize = appTabbarFontSize
        self.appTabbarBackgroundImage = appTabbarBackgroundImage
        self.appTabbarTransparent = appTabbarTransparent
        self.navigation = navigation
        self.tabbar = tabbar
    }
}

public struct NavigationConfig: Codable {
    
    public let gestureControlled: Bool
    public let navigationTransparent: Bool
    public let backButtonTitle: String
    public let backButtonImage: String
    public let backButtonFont: String
    public let backButtonFontSize: Int
    public let backButtonColor: String
    public let navigationTitle: String
    public let navigationBackgroundColor: String
    public let navigationBackgroundImage: String
    
    public init(gestureControlled: Bool,navigationTransparent: Bool,backButtonTitle: String, backButtonImage: String, backButtonFont: String, backButtonFontSize: Int, backButtonColor: String, navigationTitle: String, navigationBackgroundColor: String,navigationBackgroundImage: String) {
        self.gestureControlled = gestureControlled
        self.navigationTransparent = navigationTransparent
        self.backButtonTitle = backButtonTitle
        self.backButtonImage = backButtonImage
        self.backButtonFont = backButtonFont
        self.backButtonFontSize = backButtonFontSize
        self.backButtonColor = backButtonColor
        self.navigationTitle = navigationTitle
        self.navigationBackgroundColor = navigationBackgroundColor
        self.navigationBackgroundImage = navigationBackgroundImage
    }
}

public struct TabBarItem: Codable {
    public let title: String
    public let tabbarSel: String
    public let tabbarNor: String
    public let tabbarName: String
    
    public init(title: String, tabbarSel: String, tabbarNor: String, tabbarName: String) {
        self.title = title
        self.tabbarSel = tabbarSel
        self.tabbarNor = tabbarNor
        self.tabbarName = tabbarName
    }
}

public class AppConfigLoader {
    public static func loadConfig(from fileName: String) -> AppConfig? {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "json") else {
            print("找不到文件: \(fileName).json")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(AppConfig.self, from: data)
        } catch {
            print("JSON 文件解析失败: \(error)")
            return nil
        }
    }
}
