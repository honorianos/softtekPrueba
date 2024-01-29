//
//  Defaults.swift
//  softtekPrueba
//
//  Created by Oswaldo Escobar Huisa on 27/01/24.
//

import Foundation
import UIKit

public class Defaults {
    
    static func getValues(completion: @escaping() -> Void) {
        MovieRemoteConfig.shared.fetchData { value in
            if !value.isEmpty {
                let key = value
                guard let decryptUrl = try? SegurityKeys.decryptString(encryptedString: Base.url, key: key) else { return  }
                Base.url = decryptUrl
                guard let decryptUrlKey = try? SegurityKeys.decryptString(encryptedString: Base.urlKey, key: key) else { return  }
                Base.urlKey = decryptUrlKey
            }
            completion()
        }
    }
    
}
