//
//  ViewModel.swift
//  movieapp
//
//  Created by Andi on 26.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import Foundation
import SwiftUI

class MovieViewModel: ViewModel, ObservableObject {
    
    private let provider: NetworkManager?
    private let ratingModel = RatingModel()
    
    @Published var movies = [Movie]()
    @Published var favoriteMovies = [Movie]()
    
    init(provider: NetworkManager? = NetworkManager(), movies: [Movie] = []) {
        self.provider = provider
        self.movies = movies
        loadNewMovies()
    }
    
    func loadNewMovies(){
         provider?.getNewMovies(page: 1) {[weak self] movies in
               print("\(movies.count) new movies loaded")
               self?.movies.removeAll()
        
                let sortedMovies = movies.sorted(by: { (lhs, rhs) -> Bool
                    in
                    lhs.title < rhs.title
                })
                self?.movies.append(contentsOf: sortedMovies)}
    }
    
    func ratingForMovieId(id: Int)->Int{
        return ratingModel.ratingForMovieId(movieId: id)
    }
    
    func updateRating(movieId: Int, rating: Int){
        ratingModel.updateRating(movieId: movieId, rating: rating)
    }
    
    func isFavorite(id: Int) -> Bool {
        ratingModel.isFavorite(id: id)
    }
    
    func updateFavorites(id: Int) {
        ratingModel.handleFavorites(id: id)
    }
    
}
