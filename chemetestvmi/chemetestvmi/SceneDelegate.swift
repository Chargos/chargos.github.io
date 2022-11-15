//
//  SceneDelegate.swift
//  chemetestvmi
//
//  Created by Petrovichev Maksim on 26.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        if let userActivity = connectionOptions.userActivities.first {
            debugPrint("got user activity")
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let objViewcontroller = UIApplication.topViewController()
            
            if let url = URLContexts.first?.url {
                print(url)
                let urlStr = url.absoluteString //1
                // Parse the custom URL as per your requirement.
                let component = urlStr.components(separatedBy: "=") // 2
                if component.count > 1, let appId = component.last { // 3
                    print(appId)
                    let topViewController = self.window?.rootViewController as? UINavigationController
                    let alertController: UIAlertController = .init(
                        title: "Application Id : " + appId,
                        message: nil,
                        preferredStyle: .alert
                    )

                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
                        print(self!)
                    }))

                    objViewcontroller?.present(alertController, animated: true)
                }
            }
        }
    }
    
    func scene(_ scene: UIScene, willContinueUserActivityWithType userActivityType: String) {
        print(userActivityType)
        print(userActivity)
        

    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        let objViewcontroller = UIApplication.topViewController()
        
        if let url = userActivity.webpageURL {
            print(url)
            let urlStr = url.absoluteString //1
            // Parse the custom URL as per your requirement.
            let component = urlStr.components(separatedBy: "=") // 2
            if component.count > 1, let appId = component.last { // 3
                print(appId)
                let topViewController = self.window?.rootViewController as? UINavigationController
                let currentVC = topViewController?.topViewController as? UIViewController
                let alertController: UIAlertController = .init(
                    title: userActivity.webpageURL?.absoluteString ?? "",
                    message: nil,
                    preferredStyle: .alert
                )

                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
                    print(self!)
                }))

                objViewcontroller?.present(alertController, animated: true)
            }
        }
    }
    
    
}

extension UIApplication {
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }
}
