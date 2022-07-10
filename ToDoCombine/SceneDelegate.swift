//
//  SceneDelegate.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 08.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = BarController()
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .dark
    }
    }
    
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
//        window?.windowScene = windowScene
//        window?.rootViewController = BarController()
//        window?.makeKeyAndVisible()
//
//    }


