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
        API.fetchPopularMovies(page){ data in
            self.totalPages = data.totalPages
            self.movies = data.results
            self.collectionView.reloadData()
        }
    }
    private func loadMoreData() {
        if page < totalPages {
            page += 1
            OperationQueue.main.addOperation {
                API.fetchPopularMovies(self.page){ data in
                    self.movies? += data.results
                    self.collectionView.reloadData()
                }
            }
        }
    }
    }
extension PopularMoviesVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MovieCollectionViewCell
        cell.movie = movies?[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell : UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let count = movies?.count else{fatalError()}
        if indexPath.item == count - 1{
            self.loadMoreData()
        }
    }
    
}
