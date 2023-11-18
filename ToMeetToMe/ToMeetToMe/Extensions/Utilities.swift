//
//  Utilities.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/11/10.
//

import Foundation
import UIKit

final class Utilities {
    static let shared = Utilities()
    private init() { }
    
    @MainActor  // 최상위뷰 찾는 메서드
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

