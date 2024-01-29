//
//  SceneDelegate.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 26/01/24.
//

import UIKit
import Network
import FirebaseCore

var isOnline: Bool = false


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let router = LoginRouter()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        FirebaseApp.configure()
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                isOnline = true
                print("Con Internet")
            }else{
                print("Sin Internet")
                isOnline = false
            }
        }
        
        monitor.start(queue: queue)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        Defaults.getValues { [self] in
            router.showLoginModule(window: window)
        }
        
    }
    
}

