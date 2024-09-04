//
//  UIApplication++.swift
//  CherryFriends
//
//  Created by MEETU on 29/7/2024.
//

import UIKit

extension UIApplication {
    
    public func getRootViewController() -> UIViewController? {
        // 尝试从当前活动场景中获取根视图控制器
        if #available(iOS 13.0, *) {
            if let scene = self.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                return scene.windows.first(where: { $0.isKeyWindow })?.rootViewController ?? UIViewController()
            }
        }
        
        // 如果无法从当前活动场景中获取，尝试从 keyWindow 中获取根视图控制器
        if let rootViewController = self.keyWindow?.rootViewController {
            return rootViewController
        }
        
        // 如果以上方法都未获取到根视图控制器，则尝试从 AppDelegate 的 window 中获取
        if let rootViewController = self.delegate?.window??.rootViewController {
            return rootViewController
        }
        
        // 如果以上方法都未获取到根视图控制器，则返回一个默认的视图控制器
        return nil
    }
}
