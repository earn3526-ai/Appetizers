//
//  NetworkManager.swift
//  Appeitizers
//
//  Created by Pavan on 02/09/25.
//

import Foundation


final class NetworkManager{
    
    static let shared = NetworkManager()
    static let baseUrl = "https://dummyjson.com/"
     let appeitzerUrl = baseUrl + "recipes"
    private init(){
        
    }
    
    func getAppietizers(parms: String = "" , completion: @escaping (Result<[Appeitizer], APError>) -> Void){
        guard let url = URL(string: appeitzerUrl) else{
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data,response, error in
            if let _ = error{
                completion(.failure(.unableToComplete))
                return
            }
            guard let  response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else{
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppeitzerResponse.self, from: data)
                completion(.success(decodedResponse.recipes))
            }catch{
                completion(.failure(.invalidData))
            }
            
        }
        task.resume()
    }
    
}

