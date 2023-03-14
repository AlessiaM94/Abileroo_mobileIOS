//
//  DataManager.swift
//  Abileroo
//
//  Created by abinsula on 14/03/23.
//

import Foundation

class DataManager {
    
    static let sharedDmanager = DataManager()
    
    func getObject<T: Codable>(type: T, key: String) -> T {
        let defaults = UserDefaults.standard
        if let prodottoClick = defaults.data(forKey: key) {
            let jsonDecoder = JSONDecoder()
            if let decoded = try? jsonDecoder.decode(T.self, from: prodottoClick) {
                return decoded
            }
        }
        return type
    }
}
