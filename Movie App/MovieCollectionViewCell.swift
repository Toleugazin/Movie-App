 //
//  MovieCollectionViewCell.swift
//  Movie App
//
//  Created by Olzhas Toleugazin on 9/22/20.
//  Copyright © 2020 Olzhas Toleugazin. All rights reserved.
//

import UIKit
import Kingfisher
 
class MovieCollectionViewCell: UICollectionViewCell {
  
     @IBOutlet weak var movieImage: UIImageView!
    var movie: Movie?{
        didSet{
            if let movie = movie {
                movieImage.kf.setImage(with: movie.posterPath.url)
            }
        }
    }
    
    
   
 }
 extension String {
    var url: URL? {
        return URL(string: "\(posterUrl)\(self)")
    }

 }
