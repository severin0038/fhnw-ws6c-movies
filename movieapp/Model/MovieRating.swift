//
//  MovieRating.swift
//  movieapp
//
//  Created by Andi on 26.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import Foundation
import RealmSwift

class MovieRating: Object{
    
    @objc dynamic var movieId: Int = 0
    @objc dynamic var rating:  Int = 0
    @objc dynamic var isFavorite: Bool = false

    override class func primaryKey() -> String? {
        return "movieId"
    }
    
}
