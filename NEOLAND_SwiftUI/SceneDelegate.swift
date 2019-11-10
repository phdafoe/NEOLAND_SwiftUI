//
//  SceneDelegate.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    let appAssembly : AppAssemblyProtocol = AppAssembly()
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            appAssembly.applicationShowInitVC(window, scene: scene)
        }
    }

    


}

