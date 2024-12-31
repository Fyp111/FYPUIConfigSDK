import UIKit

public class FYPBaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    var config: AppConfig! // 配置对象，外部设置
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    /// 配置导航栏
    public func configureNavigation(with navigationConfig: NavigationConfig) {
        // 配置透明背景
        if navigationConfig.navigationTransparent {
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage() // 移除分割线
            navigationBar.backgroundColor = .clear
        } else if let backgroundColor = UIColor(named: navigationConfig.navigationBackgroundColor) {
            navigationBar.setBackgroundImage(nil, for: .default)
            navigationBar.shadowImage = nil
            navigationBar.backgroundColor = backgroundColor
        }
        
        // 配置背景图片
        if let backgroundImage = UIImage(named: navigationConfig.navigationBackgroundImage) {
            let backgroundImageView = UIImageView(image: backgroundImage)
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.frame = navigationBar.bounds
            backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            // 移除旧的背景视图
            navigationBar.subviews.forEach { subview in
                if subview is UIImageView, subview.frame == navigationBar.bounds {
                    subview.removeFromSuperview()
                }
            }
            
            // 添加新的背景视图
            navigationBar.insertSubview(backgroundImageView, at: 0)
        }
        
        // 配置返回按钮图片
        if let backButtonImage = UIImage(named: navigationConfig.backButtonImage) {
            navigationBar.backIndicatorImage = backButtonImage
            navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        }
        
        // 配置返回按钮颜色
        navigationBar.tintColor = UIColor(named: navigationConfig.backButtonColor) ?? .black

        // 配置返回按钮字体
        let backButtonFont = UIFont(name: navigationConfig.backButtonFont, size: CGFloat(navigationConfig.backButtonFontSize)) ?? UIFont.systemFont(ofSize: CGFloat(navigationConfig.backButtonFontSize))
        let barButtonAppearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [FYPBaseNavigationController.self])
        barButtonAppearance.setTitleTextAttributes([.font: backButtonFont], for: .normal)
        
        // 配置导航栏标题
        navigationBar.topItem?.title = navigationConfig.navigationTitle
        
        // 手势返回控制
        // 设置手势代理
        if navigationConfig.gestureControlled {
            interactivePopGestureRecognizer?.delegate = self
        }
    }
    
    /// 重写 pushViewController，动态设置返回按钮
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count >= 1 {
            
            // 自定义返回按钮
            let button = UIButton(type: .custom)
            if let backButtonImage = UIImage(named: config.navigation.backButtonImage) {
                button.setImage(backButtonImage, for: .normal)
                button.setImage(backButtonImage, for: .highlighted)
            }
            button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            button.contentHorizontalAlignment = .left
            button.addTarget(self, action: #selector(back), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            
            // 隐藏底部 TabBar
            viewControllers.last?.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
        
        // 当导航堆栈中有 2 个控制器时，恢复第一个控制器的 TabBar
        if viewControllers.count == 2 {
            viewControllers[0].hidesBottomBarWhenPushed = false
        }
    }
    
    @objc private func back() {
        popViewController(animated: true)
    }
    
    /// 手势返回条件
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return children.count > 1
    }
    
    /// 状态栏样式
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    /// 状态栏隐藏逻辑委托给顶层视图控制器
    public override var childForStatusBarHidden: UIViewController? {
        return topViewController
    }
    
    /// 动态主题切换
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            // 重新加载导航栏配置
            if let navigationConfig = config?.navigation {
                configureNavigation(with: navigationConfig)
            }
            print("导航栏主题刷新")
        }
    }
}
