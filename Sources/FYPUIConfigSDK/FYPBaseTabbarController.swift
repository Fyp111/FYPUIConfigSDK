import UIKit

public class FYPBaseTabbarController: UITabBarController {
    
    var config : AppConfig!
   
    public func loadUI(config:AppConfig){
        configureTabBar(
            with: config.tabbar,
            selectedColorName: config.appTabbarSelectedColor,
            unselectedColorName: config.appTabbarUnSelectedColor,
            bgColorName: config.appTabbarBackground,
            fontSize: CGFloat(config.appTabbarFontSize)
        )
        setTabbarBg()
    }
    
    /// 配置 TabBar
    public func configureTabBar(
        with tabItems: [TabBarItem],
        selectedColorName: String,
        unselectedColorName: String,
        bgColorName: String,
        fontSize: CGFloat
    ) {
        var viewControllers: [UIViewController] = []
        
        for item in tabItems {
            let viewController = createViewController(for: item)
            viewControllers.append(viewController)
        }
        
        self.viewControllers = viewControllers
        
        
        // 设置 TabBarItem 的文字颜色和字体大小
        setTabBarItemAppearance(
            selectedColorName: selectedColorName,
            unselectedColorName: unselectedColorName,
            bgColorName:bgColorName,
            fontSize: fontSize
          
        )
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            loadUI(config: self.config)
        }
    }
    
    private func setTabbarBg(){
        
        // 配置背景颜色
       if config.appTabbarTransparent {
           tabBar.backgroundImage = UIImage() // 设置透明背景
           tabBar.shadowImage = UIImage() // 去掉分割线
           tabBar.backgroundColor = .clear
       } else if let backgroundColor = UIColor(named: config.appTabbarBackground) {
           tabBar.backgroundImage = nil // 移除透明效果
           tabBar.shadowImage = nil
           tabBar.backgroundColor = backgroundColor
       }
        // 配置背景图片
       if let backgroundImage = UIImage(named: config.appTabbarBackgroundImage) {
           let backgroundImageView = UIImageView(image: backgroundImage)
           backgroundImageView.contentMode = .scaleAspectFill
           backgroundImageView.frame = tabBar.bounds
           backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           
           // 添加背景图片到 TabBar 上
           tabBar.insertSubview(backgroundImageView, at: 0)
       }
    }
    private func setTabBarItemAppearance(
        selectedColorName: String,
        unselectedColorName: String,
        bgColorName: String,
        fontSize: CGFloat
    ) {
        let selectedColor = UIColor(named: selectedColorName) ?? .systemBlue
        let unselectedColor = UIColor(named: unselectedColorName) ?? .gray
        
        UITabBarItem.appearance().setTitleTextAttributes([
            .foregroundColor: unselectedColor,
            .font: UIFont.systemFont(ofSize: fontSize)
        ], for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes([
            .foregroundColor: selectedColor,
            .font: UIFont.scaledFont(ofSize: fontSize, fontName: self.config.appFont)
        ], for: .selected)
        
        // 设置 TabBar 背景颜色
        tabBar.barTintColor =  UIColor(named: bgColorName) ?? .white
    }
    
    private func createViewController(for item: TabBarItem) -> FYPBaseViewController {
        let namespace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String ?? ""
        let className = "\(namespace).\(item.tabbarName)"
        
        guard let vcType = NSClassFromString(className) as? FYPBaseViewController.Type else {
            fatalError("无法找到 \(className)")
        }
        
        let viewController = vcType.init()
        viewController.title = item.title
        
        viewController.tabBarItem = UITabBarItem(
            title: item.title,
            image: UIImage(named: item.tabbarNor),
            selectedImage: UIImage(named: item.tabbarSel)
        )
        
        return viewController
    }
    
    
}
