//
//  AppAssembly.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


protocol AppAssemblyProtocol : class  {
    func applicationShowInitVC(_ window : UIWindow, scene: UIScene)
}

final class AppAssembly : AppAssemblyProtocol {
    
    private(set) var window: UIWindow?
    
    internal func applicationShowInitVC(_ window : UIWindow, scene: UIScene) {
        let actualViewController = MovieTableView()
        window.rootViewController = UIHostingController(rootView: actualViewController)
        self.window = window
        window.makeKeyAndVisible()
    }
    
    
    
}
