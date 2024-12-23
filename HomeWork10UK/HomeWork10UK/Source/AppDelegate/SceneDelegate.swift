//
//  SceneDelegate.swift
//  HomeWork10UK
//
//  Created by user on 20.12.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Витягаємо поточну сцену
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Створюємо нове вікно для поточонї сцени
        let window = UIWindow(windowScene: windowScene)
        
        // Витягаємо інстанс InitialViewController із Main.storyboard
        if let initialVc = InitialViewController.fromMainStoryboard() {
            
            // Створюємо Навігайійний контроллер
            // і передаємо інстанс InitialViewController параметром,
            // тобто, тепер у нас є контейнер, з initialVc всередині,
            // що дає змогу робити анімаційні переходи між екранами
            let navigationController = UINavigationController(rootViewController: initialVc)
            
            // Скриваємо верхню панель навігації, вона нам поки непотрібна
//            navigationController.isNavigationBarHidden = true
            
            // Записуємо у вікно кореневий контроллер, а саме navigationController
            window.rootViewController = navigationController
        }
        
        // Записуємо створене вікно в коді у змінну класу window
        self.window = window
        
        // Робимо активним і видимим створене вікно
        window.makeKeyAndVisible()
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


}

