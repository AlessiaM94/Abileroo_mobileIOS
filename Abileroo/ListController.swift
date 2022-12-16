//
//  ListController.swift
//  Abileroo
//
//  Created by abinsula on 06/12/2022.
//

import UIKit

class ListController: UIViewController{
    
    @IBOutlet weak var Botton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var image: UITableView!
    
    var searchBar: UISearchBar!
    
    var data: [CommercialActivity] = [
        CommercialActivity(name: "La Bottega del panino", address: "Viale la Plaia, 38, 09123 Cagliari CA", description: "Presenti sul mercato dal 1998, abbiamo saputo conquistare la fiducia di una clientela sempre più ampia, grazie alla qualità dei nostri snack, da sempre preparati con materie prime selezionate.", imageActivity: UIImage(imageLiteralResourceName: "La bottega del panino.jpeg")),
        CommercialActivity(name: "Bar Pasticceria La Dolce Vita", address: "Via S. Benedetto, 19, 09129 Cagliari CA", description: "Questa pasticceria può venire consigliata per i suoi ineguagliabili cantucci, cornetti e cheesecake. È ora di degustare un attimo cordiale!", imageActivity: UIImage(imageLiteralResourceName: "La dolce vita.jpeg")),
        CommercialActivity(name: "Pulcinella Gastrò", address: "Via Santa Maria Chiara, 150, 09134 Cagliari CA", description: "Pulcinella Gastrò vi accompagna durante il giorno con le sue specialità: gastronomia, bisteccheria, friggitoria, pizzeria, aperitivi, sushi, pasti veloci e tutto quello che volete!", imageActivity: UIImage(imageLiteralResourceName: "Pulcinella-gastro.png")),
        CommercialActivity(name: "E.P. Supercarni", address: "Via del Lavoro, 4, 09122 Cagliari CA", description: "Ep Supercarni è un'azienda modernissima che nasce da una grande tradizione familiare. Nel 1988 quella che era un'azienda a conduzione familiare nel settore della produzione e del commercio delle carni.", imageActivity: UIImage(imageLiteralResourceName: "EP supercarni.png"))
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar = UISearchBar(frame: .zero)
        self.searchBar.delegate = self
        searchBar.frame = .init(x: 0, y: 100, width: view.frame.width, height: 46)
        searchBar.backgroundColor = UIColor.red
        view.addSubview(searchBar)
    }
}

extension ListController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension ListController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let detail = self.storyboard?.instantiateViewController(identifier: "detailController") as! DetailController
       detail.loadView()
       detail.image.image = data[indexPath.row].imageActivity
       detail.desriptionLabel.text = data[indexPath.row].description
       self.navigationController?.pushViewController(detail, animated: true)
       detail.addressView.text = data[indexPath.row].address
       detail.titleAc.text = data[indexPath.row].name

   }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       1
   }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       data.count
   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ActivityCell {
                  let item = data[indexPath.row]
                  cell.titleLabel.text = item.name
                  cell.descriptionLabel.text = item.address
                  cell.profileImage.image = item.imageActivity
                  return cell
               }
               
               return UITableViewCell()
   }
    

    
}



struct CommercialActivity {
    let name: String
    let address: String
    let description: String
    let imageActivity: UIImage
}


