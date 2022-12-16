//
//  DetailController.swift
//  Abileroo
//
//  Created by abinsula on 06/12/2022.
//

import UIKit

class DetailController: UIViewController, UITableViewDelegate{
  
    

    @IBOutlet weak var tableProd: UITableView!
    
    @IBOutlet weak var cellProd: UIView!
    @IBOutlet weak var addressView: UILabel!
    @IBOutlet weak var image: UIImageView!
 
    @IBOutlet weak var titleAc: UILabel!
    
    @IBOutlet weak var desriptionLabel: UILabel!
    
   
    var data1: [Prodotti] =
    [
        Prodotti(nameP: "Pane", prezzo: 5.25, desProd: "Pane di alta qualità"),
        Prodotti(nameP: "Ciliegie", prezzo: 100.25, desProd: "Ciliegie di villacidro"),
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableProd.delegate = self
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       1
   }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       data1.count
   }
    
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellProd = tableView.dequeueReusableCell(withIdentifier: "cellProd", for: indexPath) as? ActCellProd {
                  let item = data1[indexPath.row]
                  cellProd.NameProd.text = item.nameP
                  cellProd.descrProd.text = item.desProd
                  return cellProd
               }
               
               return UITableViewCell()
   }
    
    
}
    
   
        
        


    
    
    struct Prodotti {
        let nameP: String
        let prezzo: Double
        let desProd: String
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


