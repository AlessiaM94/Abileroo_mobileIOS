//
//  ViewController.swift
//  Abileroo
//
//  Created by abinsula on 15/02/23.
//

import UIKit
import Alamofire

class PreferController: UIViewController, UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    

    
    @IBOutlet weak var tableViewPref: UITableView!
    @IBOutlet weak var elencoP: UILabel!
    var data3: [String] = ["Attività1", "Attività2", "Attività3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPref.dataSource = self
        tableViewPref.delegate = self
        elencoP.font = UIFont(name: "Emithey Brush", size: 40)
        self.tableViewPref.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data3.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myIdentifier3 = "cellPreferiti"
        if let cell3 = tableView.dequeueReusableCell(withIdentifier: myIdentifier3, for: indexPath) as? ActivityPreferCell {
            cell3.NomeAttPref.text = data3[indexPath.row]
            return cell3
        }
        return UITableViewCell()
    }
}
