//
//  RatingModel.swift
//  movieapp
//
//  Created by Andi on 26.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import Foundation
import RealmSwift

class RatingModel{
    
    let realm = try! Realm()
    
    func ratingForMovieId(movieId: Int)->Int{
        
        let result = realm.objects(MovieRating.self).filter("movieId = %@", movieId)
        
        guard let movieRating = result.first else{
            return 0
        }
        return movieRating.rating
    }
    
    func updateRating(movieId: Int, rating: Int){
        try! realm.write {
            realm.create(MovieRating.self, value: ["movieId": movieId, "rating": rating], update: .modified)
        }
    }
    
    func isFavorite(id: Int) -> Bool {
        let result = realm.objects(MovieRating.self).filter("movieId = %@", id)
        
        guard let movie = result.first else {
            return false
        }
        
        return movie.isFavorite
    }
    
    func handleFavorites(id: Int) {
        if isFavorite(id: id) {
            try! realm.write {
                realm.create(MovieRating.self, value: ["movieId": id, "isFavorite": false], update: .modified)
            }
        } else {
            try! realm.write {
                realm.create(MovieRating.self, value: ["movieId": id, "isFavorite": true], update: .modified)
            }
        }
    }
    
    func getFavoriteMovieIds() -> [Int] {
        let result = realm.objects(MovieRating.self).filter("isFavorite = %@", true)
        var ids = [Int]()
        
        for movieRating in result {
            ids.append(movieRating.movieId)
        }
        
        return ids
    }
    
}
