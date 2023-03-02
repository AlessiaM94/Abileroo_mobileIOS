//
//  CartManager.swift
//  Abileroo
//
//  Created by abinsula on 02/03/23.
//

import Foundation
import UIKit

class CartManager {
    
    static let shared2 = CartManager()
    
    func getProdottoAcquistato() -> [Products] {
        let defaults = UserDefaults.standard
        if let prodottoClick = defaults.data(forKey: "objects2") {
            let jsonDecoder = JSONDecoder()
            if let decoded = try? jsonDecoder.decode([Products].self, from: prodottoClick) {
                return decoded
            }
        }
        return []
    }
    
    func setProdottoAcquistato(_ prodotto: Products) {
        var prodottoNelCarrello = getProdottoAcquistato()
        print("ALE", prodottoNelCarrello, prodotto)
        prodottoNelCarrello.append(prodotto)
        setProdotti(prodotti: prodottoNelCarrello)
    }
    
    private func setProdotti(prodotti: [Products]) {
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
