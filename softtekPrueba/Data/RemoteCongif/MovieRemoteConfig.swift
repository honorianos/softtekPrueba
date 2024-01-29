//
//  MovieRemoteConfig.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import FirebaseRemoteConfig

class MovieRemoteConfig {
    private var remoteConfig: RemoteConfig
    
    static var shared: MovieRemoteConfig = {
        MovieRemoteConfig()
    }()
    
    private init() {
        remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.setDefaults(fromPlist: RemoteConfigConstants.remoteConfigDefaults)
        let settings = RemoteConfigSettings()
        remoteConfig.configSettings = settings
        fetch()
    }
    
    private func fetch() {
        remoteConfig.addOnConfigUpdateListener { configUpdate, error in
            guard let configUpdate, error == nil else { return }
            
            if configUpdate.updatedKeys.contains(RemoteConfigItem.keyUrL.rawValue) {
                self.remoteConfig.activate { status, error in
                    guard error == nil else { return }
                    print(">>>Remote Config RealTime is OK")
                }
            }
        }
    }
    
    func fetchData(completion: @escaping(String) -> Void) {
        remoteConfig.fetchAndActivate { status, error in
            guard error == nil else {
                completion(String())
                return
            }
            
            guard let keyUrl = self.remoteConfig.configValue(forKey: RemoteConfigItem.keyUrL.rawValue).stringValue,
                  let url = self.remoteConfig.configValue(forKey: RemoteConfigItem.url.rawValue).stringValue,
                  let password = self.remoteConfig.configValue(forKey: RemoteConfigItem.password.rawValue).stringValue
            else {
                completion(String())
                return
            }
            Base.url = url
            Base.urlKey = keyUrl
            completion(password)
        }
        
    }
}

enum RemoteConfigItem: String {
    case keyUrL = "keyUrlDataMovies"
    case url = "url"
    case password = "password"
}

enum RemoteConfigConstants {
    static let remoteConfigDefaults = "RemoteConfig"
}


import SwiftData

@Model
class testD {
    var id: UUID
    init(id: UUID) {
        self.id = id
    }
}
