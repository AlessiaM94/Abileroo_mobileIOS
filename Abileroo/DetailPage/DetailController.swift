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
    
    var productsToCart: [Products] = []
    
    @IBAction func onClickProdotto(_ sender: UIButton) {
        //guard let prodotto = self.data1?.products[0] else { return }
        print(CartController.sharedCcontrol.quantityToCart, (productsToCart.count - CartController.sharedCcontrol.quantityToCart + 1))
        CartManager.sharedCmanager.setProdotti(prodotti: productsToCart)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let alert = UIAlertController(title: "Hai selezionato la cella con nome: ", message: data1?.products[indexPath.row].name, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func onClickAction(_ sender: UIButton)
    {
        guard let data1 = data1 else { return }
        PreferManager.shared.setPreferito(data1)
        
    }
    var prodotti: Products?
    var data1: CommercialActivity?
    var preferiti = [CommercialActivity]()
    var prodottiCarrello = [Products]()
    let productCheckTap: Bool = true
    
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
            cell2.configure(item: item, actionPiu: {
                
                product in
                if(CartController.sharedCcontrol.quantityToCart == 1){
                    self.productsToCart.append(product)
                    print("PIU: \(product)")
                }
                
            }, actionMeno: { product in
               print("MENO: \(product)")
            })
            
            return cell2
        }
        return UITableViewCell()
    }
    
    

}
    


