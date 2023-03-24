//
//  BuyController.swift
//  Abileroo
//
//  Created by abinsula on 20/03/23.
//

import UIKit

class BuyController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let sharedBcontroller = BuyController()
    var quantitàEffettiva: Double = Double()
    var productPageBuy = [Products]()
    var prezzoXquantitaTot: Double = Double()
    
    @IBOutlet weak var tableViewSell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSell.dataSource = self
        tableViewSell.delegate = self
        tableViewSell.backgroundView = UIImageView(image: UIImage(named: "bgPay 1.jpeg"))
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
            cell4.quantitaBuy?.text = String(quantitàEffettiva) + " x"
            cell4.namePbuy.text = item.name
            cell4.prizeP.text = String(format: "%.2f", prezzoXquantita) + " €"
            
            return cell4
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewFooter = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableViewSell.frame.width, height: self.tableViewSell.frame.height*0.10))
        viewFooter.backgroundColor = .systemFill
        let lblTitle = UILabel(frame: CGRect.init(x: 0, y: 0, width: tableViewSell.frame.width, height: self.tableViewSell.frame.height*0.05))
        if(productPageBuy.count > 0){
            lblTitle.text = "Totale da pagare: \( ((productPageBuy.first?.price)!) * quantitàEffettiva)" + " Euro"
        } else {
            lblTitle.text = "Non sono presenti prodotti da acquistare!"
        }
        lblTitle.textColor = .black
        viewFooter.addSubview(lblTitle)
        return viewFooter
    }
    
}
