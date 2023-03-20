//
//  BuyController.swift
//  Abileroo
//
//  Created by abinsula on 20/03/23.
//

import UIKit

class BuyController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var productConf: [String] =  ["P.1", "P.2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSell.dataSource = self
        tableViewSell.delegate = self
        tableViewSell.backgroundView = UIImageView(image: UIImage(named: "BG-Table.jpeg"))
        self.tableViewSell.reloadData()
    }
    
    @IBOutlet weak var tableViewSell: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productConf.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell4 = tableView.dequeueReusableCell(withIdentifier: "CellPayment", for: indexPath) as? CellPayment {
            cell4.backgroundColor = UIColor.separator
            cell4.nameP.text = productConf[indexPath.row].description
            return cell4
        }
        return UITableViewCell()
    }
    
    
    
}
