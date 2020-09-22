//
//  Movie.swift
//  Movie App
//
//  Created by Olzhas Toleugazin on 9/22/20.
//  Copyright © 2020 Olzhas Toleugazin. All rights reserved.
//

import Foundation

struct Movie: Codable {
     let id: Int
     let title: String
     let overview : String
     let posterPath: String
     let backdropPath: String
     let voteCount: Int
     let voteAverage: Double
     let releaseDate: String

    
  
}
