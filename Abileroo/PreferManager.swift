//
//  PreferManager.swift
//  Abileroo
//
//  Created by abinsula on 21/02/23.
//

import Foundation
import UIKit

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
    
    
    func setPreferito(_ data1: CommercialActivity) {
        var preferitoAttuale = getPreferiti()
        preferitoAttuale.append(data1)
        setPreferiti(preferiti: preferitoAttuale)
    }
    
    func deleteAllPreferiti() {
        setPreferiti(preferiti: [])
    }
    
    
    func deleteOnePrefer(_ data: CommercialActivity){
        var preferiti = getPreferiti()
        preferiti.removeAll { activity in
            return activity.id == data.id
        }
        setPreferiti(preferiti: preferiti)
    }
    
    private func setPreferiti(preferiti: [CommercialActivity]) {
        let jsonEncoder = JSONEncoder()
        if let preferiti = try? jsonEncoder.encode(preferiti) {
            let defaults = UserDefaults.standard
            defaults.set(preferiti, forKey: "objects")
            print(preferiti)
        } else {
            print("Failed to save objects.")
        }
    }
}
    

