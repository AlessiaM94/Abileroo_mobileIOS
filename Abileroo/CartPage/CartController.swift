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
        prodottiCart.font = UIFont(name: "Emithey Brush", size: 25)
        self.tableViewCart.reloadData()

    }
    
    @IBAction func deleteAllProd(_ sender: UIButton) {
        CartManager.shared2.deleteAllProdCart()
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prodottiCarrello = CartManager.shared2.getProdottiAcquistati()
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
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .normal, title: "Delete") {
            (action, index) in
            print("Stai eliminando l'elemento ad indice: ", index.row)
            
            self.prodottiCarrello.remove(at: index.row)
            tableView.deleteRows(at: [index], with: .right)
            if(self.prodottiCarrello.count == 0) {
                self.prodottiCart.text = "Carrello vuoto"
                UserDefaults.standard.removeObject(forKey: "objects2")
                
            } else if (indexPath.row > 1 ){
                self.prodottiCart.text = "Prodotti nel carrello"
                CartManager.shared2.deleteOneProd(self.prodottiCarrello[indexPath.row - 1])
            }
        }
        return [action]
    }

}
