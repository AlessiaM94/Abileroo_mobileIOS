//
//  CartManager.swift
//  Abileroo
//
//  Created by abinsula on 02/03/23.
//

import Foundation
import UIKit

class CartManager {
    
    static let sharedCmanager = CartManager()

    func getProdottiAcquistati() -> [Products] {
        DataManager.sharedDmanager.getObject(type: [Products](), key: "objects2")
    }
    
    
    func deleteAllProdCart() {
        setProdotti(prodotti: [])
    }
    
    func deleteOneProd(_ prodotto: Products) {
        var prodotti = getProdottiAcquistati()
        prodotti.removeAll { product in
            return product.name == prodotto.name
        }
        setProdotti(prodotti: prodotti)
    }
    
    func setProdotti(prodotti: [Products]) {
        let jsonEncoder = JSONEncoder()
        if let prodotti = try? jsonEncoder.encode(prodotti) {
            let defaults = UserDefaults.standard
            defaults.set(prodotti, forKey: "objects2")
            print(prodotti)
        } else {
            print("Non è stato possibile salvare il prodotto")
        }
    }
    
    
}
