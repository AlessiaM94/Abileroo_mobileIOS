//
//  CartController.swift
//  Abileroo
//
//  Created by abinsula on 01/03/23.
//

import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableViewCart: UITableView!
    
  
    @IBOutlet weak var prodottiCart: UILabel!
    
    var prodottiCarrello = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCart.dataSource = self
        tableViewCart.delegate = self
        prodottiCart.font = UIFont(name: "Emithey Brush", size: 30)
        self.tableViewCart.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prodottiCarrello = CartManager.shared2.getProdottoAcquistato()
        self.tableViewCart.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prodottiCarrello.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifierCellCart = "cellCart"
        if let cellCart = tableView.dequeueReusableCell(withIdentifier: identifierCellCart, for: indexPath) as? CartActivityCell {
            cellCart.nomeProdCart?.text = prodottiCarrello[indexPath.row].name
            cellCart.quantitaProd?.text = "4"
            return cellCart
        }
        return UITableViewCell()
    }

}
