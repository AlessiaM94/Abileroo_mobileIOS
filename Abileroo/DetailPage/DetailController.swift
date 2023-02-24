//
//  DetailController.swift
//  Abileroo
//
//  Created by abinsula on 06/12/2022.
//

import UIKit
import Alamofire
import Foundation

class DetailController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addressView: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var titleAc: UILabel!
    @IBOutlet weak var desriptionLabel: UILabel!
    
    @IBOutlet weak var removePreferButton: UIButton!
    
    @IBAction func removePrefer(_ sender: UIButton) {
        PreferManager.shared.deleteAllPreferiti()
    }
    
    
    @IBAction func onClickAction(_ sender: UIButton)
    {
        guard let data1 = data1 else { return }
        PreferManager.shared.setPreferito(data1)
        
    }
    
    @IBAction func deleteOnePrefer(_ sender: UIButton) {
        guard let data1 = data1 else { return }
        PreferManager.shared.deleteOnePrefer(data1)
    }
    
    
    var stringaDiPassaggio: String = String()
    var data1: CommercialActivity?
    var preferiti = [CommercialActivity]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        desriptionLabel.text = self.data1?.description
        addressView.text = self.data1?.address
        titleAc.text = self.data1?.name
        titleAc.font = UIFont(name: "Emithey Brush", size: 25)
        image.sd_setImage(with: URL(string: data1?.image ?? ""))
        self.tableview.reloadData()
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (data1?.products.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell2 = tableView.dequeueReusableCell(withIdentifier: "cellProd", for: indexPath) as? ActCellProd, let item = self.data1?.products[indexPath.row] {
            cell2.configure(item: item)
            return cell2
        }
        return UITableViewCell()
    }
}
    


