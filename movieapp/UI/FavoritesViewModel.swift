//
//  FavoritesViewModel.swift
//  movieapp
//
//  Created by Andi on 27.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import Foundation
import SwiftUI

class FavoritesViewModel: ViewModel, ObservableObject {
    
    private let provider: NetworkManager?
    private let ratingModel = RatingModel()
    
    @Published var favoriteMovies = [Movie]()
    
    init(provider: NetworkManager? = NetworkManager(), movies: [Movie] = []) {
        self.provider = provider
        self.favoriteMovies = movies
        loadNewMovies()
    }
    
    func loadNewMovies(){
         provider?.getNewMovies(page: 1) {[weak self] movies in
           print("\(movies.count) new movies loaded")
           self?.favoriteMovies.removeAll()
    
            let sortedMovies = movies.sorted(by: { (lhs, rhs) -> Bool
                in
                lhs.title < rhs.title
            })
        
            let favoriteIds = self?.ratingModel.getFavoriteMovieIds()
            let favMovies = sortedMovies.filter { (movie) -> Bool in
                return (favoriteIds?.contains(movie.id) ?? false)
            }
            self?.favoriteMovies.append(contentsOf: favMovies)}
    }
    
    func ratingForMovieId(id: Int) ->Int {
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
        self.setFavoriteMovies()
    }
        
    func setFavoriteMovies() {
        let favoriteIds = ratingModel.getFavoriteMovieIds()
        
        self.favoriteMovies = self.favoriteMovies.filter { (movie) -> Bool in
            return favoriteIds.contains(movie.id)
        }
    }

}
