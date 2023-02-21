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
    
    var preferiti = PreferManager.shared.getPreferiti()
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
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        preferiti.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myIdentifier3 = "cellPreferiti"
        if let cell3 = tableView.dequeueReusableCell(withIdentifier: myIdentifier3, for: indexPath) as? ActivityPreferCell {
            cell3.immagineAttPref.sd_setImage(with: URL(string: preferiti[indexPath.row].image ?? " "))
            cell3.NomeAttPref?.text = preferiti[indexPath.row].name
            return cell3
        }
        return UITableViewCell()
    }
}
