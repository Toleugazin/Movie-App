//
//  PopularMoviesVC.swift
//  Movie App
//
//  Created by Olzhas Toleugazin on 9/21/20.
//  Copyright © 2020 Olzhas Toleugazin. All rights reserved.
//

import UIKit

private let identifier = "MovieCell"

class PopularMoviesVC: UIViewController {

    private var movies: [Movie]?
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - 20)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: 450)
        fetch()
        
        }
    private func fetch() {
            API.fetchPopularMovies { data in
            self.movies = data.results
            self.collectionView.reloadData()
        }
    }

    }
    extension PopularMoviesVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MovieCollectionViewCell
        cell.movie = movies?[indexPath.row]
        return cell
    }
    
    
}
