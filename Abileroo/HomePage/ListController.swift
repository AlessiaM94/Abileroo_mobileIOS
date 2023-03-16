//
//  ListController.swift
//  Abileroo
//
//  Created by abinsula on 06/12/2022.
//

import UIKit
import Alamofire
import SDWebImage

class ListController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate{
    
    @IBOutlet weak var ricerca: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var image: UITableView!
    
    
    
    
    
    var filtro = Array<String>()
    var searching: Bool = false
    var text = ""
    var list = [CommercialActivity]()
    var data = [CommercialActivity]()
    
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
    
    func tabBarBassa(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 1) {
            ListController().viewDidLoad()
        } else if(item.tag == 2) {
            performSegue(withIdentifier: "PreferSegue", sender: view)
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


extension ListController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        print(" ")
    }
}

extension ListController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
    if(searchText.isEmpty){
                 searching = false
                 
                }else{
                    searching = true
                    text = searchText
                    list = data.filter{
                       dato in return dato.name!.contains(text)
                       }                }
                tableview.reloadData()
        }
    
}

extension ListController {
    
    func numberOfSections(in tableView: UITableView) -> Int {1}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searching){
            print(list)
            return list.count}
        else{return data.count}
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myIdentifier = "cell"
        if let cell1 = tableView.dequeueReusableCell(withIdentifier: myIdentifier, for: indexPath as IndexPath) as? ActivityCell {
            if(searching ){
             
                print(list)
                let item = list[indexPath.row]
                    cell1.configure2(item: item)
                    return cell1
            } else {
                let item = data[indexPath.row]
                cell1.configure2(item: item)
                return cell1
                }
            }
        return UITableViewCell()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
       guard segue.identifier != nil else  {
                  print("il segue non ha un identifier, esco dal prepareForSegue")
                  return
              }
       print("Sender: \(String(describing: sender))")
       let riga = sender as? Int
        print("Riga: \(riga!)")
       (segue.destination as! DetailController).data1 = data[riga!]
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



