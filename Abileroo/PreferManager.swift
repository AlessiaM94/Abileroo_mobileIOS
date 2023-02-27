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
    
    // nomeFunzione() -> Dato in uscita(output) (in questo caso Array di Attività commerciali)
    // Il corpo della funzione getPreferiti prende i dati con la chiave di identificazione "objects" e li salva in una costante preferitoSalvato e fa il decode tramite JSONDecoder, e restituisce un array di Commercial Activity.
    func getPreferiti() -> [CommercialActivity] {
        let defaults = UserDefaults.standard
        
        if let preferitoSalvato = defaults.data(forKey: "objects") {
            let jsonDecoder = JSONDecoder()
            if let decoded = try? jsonDecoder.decode([CommercialActivity].self, from: preferitoSalvato) {
                return decoded // Return interrompe la funzione ed esce dal blocco portando fuori l'informazione (Array di CommercialActivity preferite).
            }
        }
        return [] // Altrimenti, se nel corpo della funzione c'è qualcosa che non funziona, restituisce un'Array vuoto.
    }
    
    //func nomeFunzione (nomeParamentro: Tipo di dato da prendere in ingresso(input) (in questo caso un'attività commerciale singola)) --> recupera i preferiti e li salva in una variabile nuova "preferitoAttuale", dopodichè aggiunge la singola attività tramite "append" alla stessa var (preferitoAttuale)
    func setPreferito(_ data1: CommercialActivity) {
        var preferitoAttuale = getPreferiti()
        preferitoAttuale.append(data1)
        setPreferiti(preferiti: preferitoAttuale)
    }
    
    // Prende tutti i preferiti e li sovrascrive con un Array vuoto.
    func deleteAllPreferiti() {
        setPreferiti(preferiti: [])
    }
    
    
   //
    func deleteOnePrefer(_ data: CommercialActivity){
        var preferiti = getPreferiti()
        preferiti.removeAll { activity in
            return activity.id == data.id
        }
        setPreferiti(preferiti: preferiti)
    }
    
   
    
    //private = Accessibile solo all'interno della classe.
    //input
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
    

