//
//  MovieInfoVC.swift
//  Movie App
//
//  Created by Olzhas Toleugazin on 9/24/20.
//  Copyright © 2020 Olzhas Toleugazin. All rights reserved.
//

import UIKit

class MovieInfoVC: UIViewController {
    
    private var movies: [Movie]?
    private var page: Int = 1
    private var totalPages: Int = 0
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.size.width - 20)
        let height = (view.frame.size.height - 300)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
        
        fetch()
       
    }
    
    private func fetch(_ page: Int = 1) {
        API.fetchMovies("popular", page: page ){ data in
            self.totalPages = data.totalPages
            self.movies = data.results
            self.collectionView.reloadData()
        }
    }
    private func loadMoreData() {
        if page < totalPages {
            page += 1
            OperationQueue.main.addOperation {
                API.fetchMovies("popular", page: self.page){ data in
                    self.movies? += data.results
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension MovieInfoVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 1
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! MovieCollectionViewCell
           cell.movie = movies?[indexPath.row]
           return cell
       }
    
}
