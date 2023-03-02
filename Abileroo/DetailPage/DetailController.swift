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
    
    
    @IBOutlet weak var cartButton: UIButton!
    
    
    @IBAction func onClickProdotto(_ sender: UIButton) {
        guard let prodotto = data1?.products[0] else { return }
        print("ciao", prodottiCarrello, prodotto)
        CartManager.shared2.setProdottoAcquistato(prodotto)
        
    }
    
    
    @IBAction func onClickAction(_ sender: UIButton)
    {
        guard let data1 = data1 else { return }
        PreferManager.shared.setPreferito(data1)
        
    }
    
    
    
    var prodotti: Products?
    var stringaDiPassaggio: String = String()
    var data1: CommercialActivity?
    var preferiti = [CommercialActivity]()
    var prodottiCarrello = [Products]()
    
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
    


