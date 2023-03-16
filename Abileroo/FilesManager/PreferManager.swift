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
    func getPreferiti() -> [CommercialActivity] {
        DataManager.sharedDmanager.getObject(type: [CommercialActivity](), key: "objects")
    }
    
    //func nomeFunzione (nomeParamentro: Tipo di dato da prendere in ingresso(input) (in questo caso un'attività commerciale singola)) --> recupera i preferiti e li salva in una variabile nuova "preferitoAttuale", dopodichè aggiunge la singola attività tramite "append" alla stessa var (preferitoAttuale)
    //Aggiunta di una booleana settata in false per il controllo della presenza o meno dell'attività commerciale. Attraverso un ciclo For si controlla se l'id dell'attività è presente e si setta la variabile in true. Se non è presente (e quindi è false), procede con l'aggiunta e il set dell'attività nei preferiti.
    func setPreferito(_ data1: CommercialActivity) {
        
        var activityCheck = false
        var preferitoAttuale = getPreferiti()
        for attività in preferitoAttuale {
            if(attività.id == data1.id) {
                activityCheck = true
            }
        }
        if(activityCheck == false) {
            preferitoAttuale.append(data1)
            setPreferiti(preferiti: preferitoAttuale)
        }
        
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
    

