//
//  AppDelegate.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import UIKit
import NotificationCenter

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var appCoordinator = AppCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appCoordinator.tabBarController
        window?.makeKeyAndVisible()
        appCoordinator.start()

        UNUserNotificationCenter.current().delegate = self
        return true
    }




}

// MARK: UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
}
