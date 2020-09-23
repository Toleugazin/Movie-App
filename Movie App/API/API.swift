//  API.swift
//  Movie App
//
//  Created by Olzhas Toleugazin on 9/22/20.
//  Copyright © 2020 Olzhas Toleugazin. All rights reserved.
//

import Foundation
import Alamofire


private let baseUrl = "https://api.themoviedb.org/3/movie/"
let posterUrl = "http://image.tmdb.org/t/p/original"
let apiKey = "f90a11bddcb744446fef64b71cef3535"
private let coder = JSONDecoder()

class API {
    
    class func fetchMovies(_ movies: String, page: Int, onSuccess: @escaping (Results) -> Void){
        
        coder.keyDecodingStrategy = .convertFromSnakeCase
        
        let urlStr = "\(baseUrl)\(movies)?api_key=\(apiKey)&page=\(page)"
        guard let url = URL(string: urlStr) else {
            fatalError("Unable To get URL")
        }
        AF.request(url).response {response in
            switch response.result{
            case .success(let data):
                guard let data = data else {
                    fatalError("Unable To Parse Data")
                }
                guard let results = try? coder.decode(Results.self, from: data) else {
                    fatalError("Unable to parse data into json")
                }
                DispatchQueue.main.async {
                    onSuccess(results)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
