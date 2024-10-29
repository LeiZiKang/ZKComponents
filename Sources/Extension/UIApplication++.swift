//
//  UIApplication++.swift
//  CherryFriends
//
//  Created by MEETU on 29/7/2024.
//

import UIKit

extension UIApplication {
    
    public func zkGetRootViewController() -> UIViewController? {
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
    
    /// 直接退出App
    /// UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    /// 这个方法会让当前的 first responder 失去响应者状态，通常会触发一些收尾工作，比如关闭键盘。
    /// exit(0)
    /// 这个方法会直接终止程序，但是不建议在实际应用中使用，因为它会直接杀死进程，可能导致数据丢失。
    /// 不建议使用
    public func exitApp() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        exit(0)
    }
}



