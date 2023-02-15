//
//  ViewController.swift
//  Abileroo
//
//  Created by abinsula on 15/02/23.
//

import UIKit

class PreferController: UIViewController, UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    

    
    @IBOutlet weak var tableViewPref: UITableView!
    @IBOutlet weak var elencoP: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPref.dataSource = self
        tableViewPref.delegate = self
        
        elencoP.font = UIFont(name: "Emithey Brush", size: 30)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifierCellPref = "cellPreferiti"
        if let cell3 = tableView.dequeueReusableCell(withIdentifier: identifierCellPref, for: indexPath as IndexPath) as? ActivityPreferCell{
            return cell3
        }
        return UITableViewCell()
    }
    
}
