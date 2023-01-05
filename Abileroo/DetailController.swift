//
//  DetailController.swift
//  Abileroo
//
//  Created by abinsula on 06/12/2022.
//

import UIKit








class DetailController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addressView: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var titleAc: UILabel!
    @IBOutlet weak var desriptionLabel: UILabel!
    
    var stringaDiPassaggio: String = String()
    var data1: CommercialActivity?
    var prodotti = [Products]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        desriptionLabel.text = self.data1?.description
        addressView.text = self.data1?.address
        titleAc.text = self.data1?.name
        image.image = data1?.image?.convImmagine()
        self.tableview.reloadData()
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prodotti.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell2 = tableView.dequeueReusableCell(withIdentifier: "cellProd", for: indexPath) as? ActCellProd {
            let item2 = prodotti[indexPath.row]
            cell2.NomProd.text = item2.name
            cell2.DescProd.text = item2.description
            return cell2
        }
        
        return UITableViewCell()
    }

    
    
    
    
}
