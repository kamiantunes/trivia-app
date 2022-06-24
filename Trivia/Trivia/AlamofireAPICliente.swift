//
//  AlamofireAPICliente.swift
//  Trivia
//
//  Created by Kamilla Mylena Teixeira Antunes on 22/06/22.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result) }
    }
}
