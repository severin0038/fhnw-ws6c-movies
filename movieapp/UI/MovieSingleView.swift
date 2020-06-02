//
//  MovieSingleView.swift
//  movieapp
//
//  Created by user on 01.06.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import Kingfisher
import SwiftUI

struct MovieSingleView: SwiftUI.View {
    
    let movie: Movie
    
    var body: some SwiftUI.View {
        
        VStack {
            ZStack {
            KFImage(movie.fullPosterURL)
                .cancelOnDisappear(true)
                .resizable()
                .frame(height: 210)
                .cornerRadius(6)
                .background(Color.blue)
            }
            VStack {
            
                HStack {
                    Text(movie.title)
                        .font(.system(size: 22))
                        .bold()
                    Text("(" + getYear(s: movie.releaseDate) + ")")
                        .font(.system(size: 22))
                    Spacer()
                }.padding(15)
                
                VStack(spacing:7) {
                    HStack {
                        Text("Rating")
                            .font(.system(size: 16))
                            .bold()
                            .frame(width: 180, alignment: .leading)
                        Text(String(movie.voteAverage))
                            .font(.system(size: 16))
                        Text("(" + String(movie.voteCount) + " Votes)")
                            .font(.system(size: 13))
                        Spacer()
                    }
                    
                    HStack {
                        Text("Veröffentlicht am")
                            .font(.system(size: 16))
                            .bold()
                            .frame(width: 180, alignment: .leading)
                        Text(String(movie.releaseDate))
                            .font(.system(size: 16))
                        Spacer()
                    }
                    
                    HStack {
                        Text("Für Kinder geeignet")
                            .font(.system(size: 16))
                            .bold()
                            .frame(width: 180, alignment: .leading)
                        if(movie.adult) {
                            Text("Nein")
                                .font(.system(size: 16))
                        } else {
                            Text("Ja")
                                .font(.system(size: 16))
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Originaltitel")
                            .font(.system(size: 16))
                            .bold()
                            .frame(width: 180, alignment: .leading)
                        Text(String(movie.originalTitle))
                            .font(.system(size: 16))
                        Spacer()
                    }
                    
                    HStack {
                        Text("Originalsprache")
                            .font(.system(size: 16))
                            .bold()
                            .frame(width: 180, alignment: .leading)
                        Text(String(movie.originalLanguage))
                            .font(.system(size: 16))
                        Spacer()
                    }
                }.padding(15)
            }
            Spacer()
        }
    }
}

struct MovieSingleView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        MovieSingleView(movie: Movie(popularity: 0, voteCount: 0, video: false, posterPath: "", id: 0, adult: false, backdropPath: "", originalLanguage: "", originalTitle: "", genreIDS: [0], title: "", voteAverage: 0, overview: "", releaseDate: ""))
    }
}

func getYear(s: String) -> Substring {
    let i = s.startIndex..<s.index(s.startIndex, offsetBy: 4)
    return s[i]
}
