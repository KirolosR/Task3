//
//  GetData.swift
//  Task3
//
//  Created by Kirolos on 4/15/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import Foundation
import Alamofire

class GetData {
    
   static let instance = GetData()
    
    static var bestSeller : [BestSeller]?
    static var brands : [Brand]?
    
    
    func getBestSeller (Url : String ,completion :@escaping competionHandler){
        Alamofire.request(Url, method: .get ).responseJSON {
            (response) in
            if response.result.error == nil {
                guard let data = response.data  else { return }
                // let json = try? JSONSerialization.data(withJSONObject: data)
                
                guard let ar = try? JSONDecoder().decode([BestSeller].self , from : data)  else {
                    debugPrint(" Can't parse json")
                    return }
                
                debugPrint(ar)
                GetData.bestSeller = ar
                
                
                debugPrint(response.result.value as Any)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    func getBrands (Url : String ,completion :@escaping competionHandler){
        Alamofire.request(Url, method: .get ).responseJSON {
            (response) in
            if response.result.error == nil {
                guard let data = response.data  else { return }
                // let json = try? JSONSerialization.data(withJSONObject: data)
                
                guard let ar = try? JSONDecoder().decode([Brand].self , from : data)  else {
                    debugPrint(" Can't parse json")
                    return }
                
                debugPrint(ar)
                GetData.brands = ar
                
                
                debugPrint(response.result.value as Any)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
}
