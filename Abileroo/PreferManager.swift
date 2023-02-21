//
//  PreferManager.swift
//  Abileroo
//
//  Created by abinsula on 21/02/23.
//

import Foundation

class PreferManager {
    
    static let shared = PreferManager()
    
    func getPreferiti() -> [CommercialActivity] {
        let defaults = UserDefaults.standard
        if let preferitoSalvato = defaults.data(forKey: "objects") {
            let jsonDecoder = JSONDecoder()
            if let decoded = try? jsonDecoder.decode([CommercialActivity].self, from: preferitoSalvato) {
                return decoded
            }
        }
        return []
    }
    
    
    func setPreferiti(_ data1: CommercialActivity) {
        let jsonEncoder = JSONEncoder()
        var preferitoAttuale = getPreferiti()
        preferitoAttuale.append(data1)
        if let preferiti = try? jsonEncoder.encode(preferitoAttuale) {
            let defaults = UserDefaults.standard
            defaults.set(preferiti, forKey: "objects")
            print(preferiti)
        } else {
            print("Failed to save objects.")
        }
    }
    
    func deleteAllPreferiti(_ data1: CommercialActivity) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "objects")
    }
    
}
