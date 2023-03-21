//
//  BuyManager.swift
//  Abileroo
//
//  Created by abinsula on 21/03/23.
//

import Foundation
import UIKit

class BuyManager {
    static let sharedBmanager = BuyManager()
    
    func getProdBuy() -> [Products] {
        DataManager.sharedDmanager.getObject(type: [Products](), key: "objects3")
    }
    
    func setProdBuy(buyProducts: [Products]) {
        let jsonEncoder = JSONEncoder()
        if let buyProducts = try? jsonEncoder.encode(buyProducts) {
            let defaults = UserDefaults.standard
            defaults.set(buyProducts, forKey: "objects3")
            print(buyProducts)
        } else {
            print("Non è stato possibile salvare il prodotto")
        }
    }
    
}
