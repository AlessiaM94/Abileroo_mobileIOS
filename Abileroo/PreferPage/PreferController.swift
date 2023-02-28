//
//  ViewController.swift
//  Abileroo
//
//  Created by abinsula on 15/02/23.
//

import UIKit
import Alamofire
import Foundation

class PreferController: UIViewController, UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    var preferiti = [CommercialActivity]()
    var prefer: Bool = false
    

    

    
    @IBOutlet weak var tableViewPref: UITableView!
    @IBOutlet weak var elencoP: UILabel!
   
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPref.dataSource = self
        tableViewPref.delegate = self
        elencoP.font = UIFont(name: "Emithey Brush", size: 40)
        self.tableViewPref.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        preferiti = PreferManager.shared.getPreferiti()
        self.tableViewPref.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        preferiti.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myIdentifier3 = "cellPreferiti"
        if let cell3 = preferiti.count == 0 ? nil : tableView.dequeueReusableCell(withIdentifier: myIdentifier3, for: indexPath) as? ActivityPreferCell {
            cell3.immagineAttPref.sd_setImage(with: URL(string: preferiti[indexPath.row].image ?? " "))
            cell3.NomeAttPref?.text = preferiti[indexPath.row].name
            return cell3
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction.init(
            style: .default, title: "Delete"
        ) {
            (action, index) in
            print("Delete", index.row)
            
            
            self.preferiti.remove(at: index.row)
            print("index.row è: ", index.row)
            print("indexPath.row è: ", [indexPath.row])
            tableView.deleteRows(at: [index], with: .right)
            
            if(self.preferiti.count == 0) {
                self.elencoP.text = "Nessun preferito"
                UserDefaults.standard.removeObject(forKey: "objects")
                
            } else if (indexPath.row > 1 ){
                self.elencoP.text = "Elenco preferiti"
                PreferManager.shared.deleteOnePrefer(self.preferiti[indexPath.row - 1])
            } /*else if (indexPath.row == 1){
                PreferManager.shared.deleteOnePrefer(self.preferiti[indexPath.row])
            }*/
        }
        
        return [action]
    }
    
}
