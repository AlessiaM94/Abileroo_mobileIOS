//
//  BuyController.swift
//  Abileroo
//
//  Created by abinsula on 20/03/23.
//

import UIKit

class BuyController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var productConf: [String] =  ["P.1", "P.2", "P.3"]
    var quantitàEffettiva: Double = Double()
    var productPageBuy = [Products]()
    
    @IBOutlet weak var tableViewSell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSell.dataSource = self
        tableViewSell.delegate = self
        tableViewSell.backgroundView = UIImageView(image: UIImage(named: "BG-Table.jpeg"))
        quantitàEffettiva = Double(CartController.sharedCcontrol.quantityToCart)
        self.tableViewSell.reloadData()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productPageBuy = CartManager.sharedCmanager.getProdottiAcquistati()
        self.tableViewSell.reloadData()
    }
    
    
    
    // TABLE PRODOTTI PAGINA ACQUISTA
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productPageBuy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell4 = tableView.dequeueReusableCell(withIdentifier: "CellPayment", for: indexPath) as? CellPayment {
            let item = productPageBuy[indexPath.row]
            let prezzoXquantita = ((item.price ?? 0.00) * quantitàEffettiva)
            cell4.backgroundColor = UIColor.opaqueSeparator
            cell4.quantitaBuy?.text = String(quantitàEffettiva) + " x"
            cell4.namePbuy.text = item.name
            cell4.prizeP.text = String(format: "%.2f", prezzoXquantita) + " €"
            
            return cell4
        }
        return UITableViewCell()
    }
    
    
    
}
