//
//  MovieRow.swift
//  movieapp
//
//  Created by Andi on 26.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import Kingfisher
import SwiftUI

struct MovieRow: SwiftUI.View {
    
    let movie: Movie
    let viewModel: MovieViewModel
    
    var body: some SwiftUI.View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top
            )) {
                KFImage(movie.fullPosterURL)
                    .cancelOnDisappear(true)
                    .resizable()
                    .frame(height: 210)
                    .cornerRadius(6)
                
                VStack(alignment: .leading) {
                    Text(movie.title.uppercased())
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, 25)
                        .padding(.top, 15)
                        .padding(.bottom, 6)
                        .foregroundColor(.white)
                        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.66), radius: 2)
                    
                    Text(getYear(s: movie.releaseDate))
                        .font(.system(size: 12))
                        .padding(.horizontal, 25)
                        .foregroundColor(.white)
                        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.8), radius: 2)
                }
            }
            
            RatingSummaryView(rating: self.viewModel.ratingForMovieId(id: movie.id))
                .padding(.horizontal, 25)
                .padding(.vertical, 13)
        }
        .shadow(radius: 6, y: 13)
    }
    
    func getYear(s: String) -> Substring {
        let i = s.startIndex..<s.index(s.startIndex, offsetBy: 4)
        return s[i]
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        MovieRow(movie: ExampleDataProvider.movies[0], viewModel: MovieViewModel())
    }
}
