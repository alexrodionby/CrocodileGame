//
//  SceneDelegate.swift
//  CrocodileGame
//
//  Created by Alexandr Rodionov on 16.04.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
//        var team = Team(name: "Ковбои", image: "cowboy", score: 2)
//        let controller = CorrectViewController(team: team)
//        team.score = 7
//        controller.configure(with: team, answer: true)
//        let navigationController = UINavigationController(rootViewController: controller)
        let navigationController = UINavigationController(rootViewController: MainViewController())
        navigationController.navigationBar.tintColor = .black
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
