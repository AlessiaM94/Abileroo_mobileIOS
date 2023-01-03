//
//  ApiCall.swift
//  Abileroo
//
//  Created by abinsula on 02/01/2023.
//

import UIKit
import Alamofire

class ApiCall: ListController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMethod()
        // Do any additional setup after loading the view.
    }
    
    func getMethod() {
        
        AF.request("https://enrobax.pythonanywhere.com/api/shops/", method: .get, parameters: data).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                            print("Error: Cannot convert data to JSON object")
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                            print("Error: Could print JSON in String")
                            return
                        }
                        
                        print(prettyPrintedJson)
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                case .failure(let error):
                    print(error)
            }
        }

}
}
