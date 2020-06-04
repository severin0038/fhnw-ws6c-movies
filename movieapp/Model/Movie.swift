//
//  Movie.swift
//  movieapp
//
//  Created by Andi on 26.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import Foundation
import SwiftUI

struct Movie: Codable, Identifiable {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String?
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let originalLanguage: String
    let originalTitle: String
    let genreIDS: [Int]
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}

extension Movie{
    var fullPosterURL:URL?{
        get{
            var imgPath = ""
            if (backdropPath == nil) {
                imgPath = "https://via.placeholder.com/500x281?text=No%20image"
            } else {
                imgPath = "https://image.tmdb.org/t/p/w500" + backdropPath!
            }
            
            return URL(string: imgPath)
        }
    }
}

