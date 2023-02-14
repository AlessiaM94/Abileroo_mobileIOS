//
//  DetailController.swift
//  Abileroo
//
//  Created by abinsula on 06/12/2022.
//

import UIKit
import Alamofire

class DetailController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addressView: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var titleAc: UILabel!
    @IBOutlet weak var desriptionLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIBarButtonItem!
    var stringaDiPassaggio: String = String()
    var data1: CommercialActivity?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        desriptionLabel.text = self.data1?.description
        addressView.text = self.data1?.address
        titleAc.text = self.data1?.name
        titleAc.font = UIFont(name: "Emithey Brush", size: 30)
        image.sd_setImage(with: URL(string: data1?.image ?? ""))
        self.tableview.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (data1?.products.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell2 = tableView.dequeueReusableCell(withIdentifier: "cellProd", for: indexPath) as? ActCellProd {
            let item2 = self.data1?.products
            print(data1?.products as Any)
            cell2.DescProd.text = item2?[0].description
            cell2.NomProd.text = item2?[0].name
            cell2.Prezzo.text = String(item2?[0].price ?? 0.00) + " €"
            cell2.ImagePr?.sd_setImage(with: URL(string: item2?[0].productImage ?? ""))
            return cell2
        }
        return UITableViewCell()
    }
}
    


