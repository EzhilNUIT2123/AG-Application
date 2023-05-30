//
//  GetProducts.swift
//  AmericanGiants
//
//  Created by Ezhilarasi on 18/05/23.
//

import Foundation
import Alamofire

enum apiError:Error{
    case failedToGetData
}

class GetProducts {
    
    static let sharedInstance = GetProducts()
    
    func kidsWear(_ handler : @escaping (Result<[ProductModel] , Error>)->(Void)){
        AF.request("https://run.mocky.io/v3/5326e123-6abb-4cf7-9c94-dac13167e62f",method: .get,parameters:nil,encoding:URLEncoding.default,headers: nil,interceptor: nil).response { response in
            switch response.result{
            case .success(let value):
                do{
                    let jsonData = try JSONDecoder().decode([ProductModel].self , from: value!)
                    print(jsonData[0].rating.rate)
                }catch{
                    print(error.localizedDescription)
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
