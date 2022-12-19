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
 
    @IBOutlet weak var titleAc: UILabel!
    @IBOutlet weak var desriptionLabel: UILabel!
    
    var data1: [Prodotti] =
    [
        Prodotti(nameP: "Pane", desProd: "Pane di alta qualità"),
        Prodotti(nameP: "Ciliegie", desProd: "Ciliegie di villacidro"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
