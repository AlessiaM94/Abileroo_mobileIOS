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
    //var commercialActivity: CommercialActivity?
    
    var data1: [Prodotti] =
        [
            Prodotti(nameP: "Pane", desProd: "Pane di alta qualità"),
            Prodotti(nameP: "Ciliegie", desProd: "Ciliegie di villacidro"),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
       
        //desriptionLabel.text = self.commercialActivity?.description
        //addressView.text = commercialActivity?.address
        //titleAc.text = self.commercialActivity?.name
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell2 = tableView.dequeueReusableCell(withIdentifier: "cellProd", for: indexPath) as? ActCellProd {
            let item2 = data1[indexPath.row]
            cell2.NomProd.text = item2.nameP
            cell2.DescProd.text = item2.desProd
            return cell2
        }
        
        return UITableViewCell()
    }

    struct Prodotti {
        let nameP: String
        let desProd: String
    }
    
    
    
}
