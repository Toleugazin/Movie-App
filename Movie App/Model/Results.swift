//
//  Results.swift
//  Movie App
//
//  Created by Olzhas Toleugazin on 9/22/20.
//  Copyright © 2020 Olzhas Toleugazin. All rights reserved.
//

import Foundation

struct Results: Codable{
    
    let results: [Movie]
    let page: Int
    let totalPages: Int
    let totalResults: Int
    
    
    
}
