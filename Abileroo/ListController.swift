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
    
    var filtro = Array<String>()
    var searching: Bool = false
    var text = ""
    var list: [CommercialActivity] = []
    
    
    
    @IBAction func vaiAlDettaglio(_ sender: UIButton) {
        print("vado avanti al dettaglio")
        self.performSegue(withIdentifier: "Detail", sender: nil)
    }
    
    
    var data = [CommercialActivity]()
    var filteredData: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        ricerca.delegate = self
        fetchAPIData { [weak self] (result) in
            switch result {
            case .success(let activities):
                self?.data = activities
                self?.tableview.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}


extension  ListController {
     
    func fetchAPIData(completion: @escaping (Result<[CommercialActivity], Error>) -> Void)  {
              let url = "https://enrobax.pythonanywhere.com/api/shops/";
              AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
                .response{ resp in
                    switch resp.result{
                      case .success(let data):
                        
                        if let jsonData = try? JSONDecoder().decode([CommercialActivity].self, from: data!) {
                            
                                completion(.success(jsonData))
                            
                        }
                        
                        else {
                            let error = NSError(domain: "", code: 101, userInfo: [NSLocalizedDescriptionKey: "Erroreee"])
                            completion(.failure(error))
                        }
                      
                    
                    case .failure(let error):
                        
                            completion(.failure(error))
                        
                     }
        }.resume()
    }
    
}



extension String {
    func convImmagine() -> UIImage? {
        if let url = URL(string: self){
            if let imageData = try? Data(contentsOf: url) {
                return UIImage(data: imageData)
            }
        }
         return nil
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
       
        if searchText.isEmpty {
                print("search Text is nil")
                searching = false
            } else {
                searching = true
                
            }
        tableview.reloadData()
        
      
        
        
        /* if(searchText.isEmpty){
                 searching = false
                 
                }else{
                    searching = true
                    text = searchText
                }
                tableview.reloadData()*/
        
            
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
            
            if(searching){
                for dato in data {
                    if(dato.name!.contains(text)){
                        list.append(dato)}
                    }
                print(list.count)
                
            }else{
                let item = data[indexPath.row]
                cell1.titleLabel?.text = item.name
                cell1.descriptionLabel?.text = item.address
                cell1.profileImage?.image = item.image?.convImmagine()
                return cell1
                
            }
                
            
            
        }
        
        return UITableViewCell()
    }
    
    
    
}



struct CommercialActivity: Codable {
    let id: Int?
    let name: String?
    let address: String?
    let description: String?
    let image: String?
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
    let availableAmount: Int?
    let description: String?
    let id: Int?
    let name: String?
    let price: Double?
    let productImage: String?
    let shop: Int?
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


