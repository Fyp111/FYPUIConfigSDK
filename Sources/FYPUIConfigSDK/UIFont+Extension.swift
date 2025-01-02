//
//  UIFont+Extension.swift
//  FYPUIConfigSDK
//
//  Created by 研发2组 on 2024/12/31.
//

import UIKit

public extension UIFont {
    /// 动态适配字体（支持自定义字体名，默认使用系统字体）
    @MainActor static func scaledFont(ofSize baseFontSize: CGFloat, fontName: String = "PingFangSC-Regular") -> UIFont {
        let scaledFontSize = FontScaler.scaledFontSize(for: baseFontSize)
        
        var fixfontName = fontName
        if fixfontName == "" {
            fixfontName = "PingFangSC-Regular"
        }
        
        return  UIFont(name: fixfontName, size: scaledFontSize)! // 如果传入的字体名有效，返回自定义字体
    }
}

/// 字体适配工具类
public struct FontScaler {
    /// iPhone 13 的屏幕宽度（基准值）
    private static let baseScreenWidth: CGFloat = 390.0
    
    /// 根据当前设备屏幕宽度，返回适配的字体大小
    @MainActor public static func scaledFontSize(for baseFontSize: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let scaleFactor = screenWidth / baseScreenWidth
        let limitedScaleFactor = min(max(scaleFactor, 0.8), 1.2)
        return baseFontSize * scaleFactor
    }
}
