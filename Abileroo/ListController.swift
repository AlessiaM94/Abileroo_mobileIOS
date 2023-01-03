//
//  ListController.swift
//  Abileroo
//
//  Created by abinsula on 06/12/2022.
//

import UIKit
import Alamofire



class ListController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
   

    @IBOutlet weak var ricerca: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var image: UITableView!
    
    
    
    
    @IBAction func vaiAlDettaglio(_ sender: UIButton) {
        print("vado avanti al dettaglio")
        self.performSegue(withIdentifier: "Detail", sender: nil)
    }
    
    var data = [CommercialActivity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ListController.sharedInstance.fetchAPIData()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.reloadData()
        
    }
}

extension  ListController {
        static let sharedInstance = ListController()
           func fetchAPIData() {
              let url = "https://enrobax.pythonanywhere.com/api/shops/";
              AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
                .response{ resp in
                    switch resp.result{
                      case .success(let data):
                        do{
                          let jsonData = try JSONDecoder().decode([CommercialActivity].self, from: data!)
                          print(jsonData)
                       } catch {
                          print(error)
                       }
                     case .failure(let error):
                       print(String(describing: error))
                     }
                }
           }
    
}

 func prepare(for segue: UIStoryboardSegue, sender: Any?){
    guard let identifier = segue.identifier else  {
               print("il segue non ha un identifier, esco dal prepareForSegue")
               return
           }
     switch identifier {
          case "Detail":
              // Accedo al destinationViewController del segue e lo casto del tipo di dato opportuno
              // Modifico la variabile d'appoggio con il contenuto che voglio inviare
            _ = segue.destination as! DetailController
    
     
     
     default:
              return
          }
   }

extension ListController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        print("Sto")
    }
    
    
}

extension ListController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension ListController {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = self.storyboard?.instantiateViewController(identifier: "detailController") as! DetailController
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ActivityCell {
            let item = data[indexPath.row]
            cell1.titleLabel?.text = item.name
            cell1.descriptionLabel?.text = item.address
            return cell1
        }
        
        return UITableViewCell()
    }
    
    
    
}



struct CommercialActivity: Codable {
    let id: Int?
    let name: String?
    let address: String?
    let description: String?
    let image: URL?
    let products: [Products]
    enum CodingKeys : String , CodingKey {
        case id
        case name
        case address
        case description
        case image
        case products
    }
}

struct Products: Codable {
    let availableAmount: Int
    let description: String
    let id: Int
    let name: String
    let price: Double
    let productImage: URL?
    let shop: Int
    enum CodingKeys : String , CodingKey {
        case availableAmount = "available_amount"
        case description
        case id
        case name
        case price
        case productImage = "product_image"
        case shop
    }
    
    
}


