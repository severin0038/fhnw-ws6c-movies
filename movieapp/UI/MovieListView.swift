//
//  MovieListView.swift
//  movieapp
//
//  Created by Andi on 26.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies) { movie in
                    MovieRow(movie: movie, viewModel: self.viewModel)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 13)
                }
            }.navigationBarTitle(Text("Discover"))
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieViewModel(provider: nil, movies: ExampleDataProvider.movies))
    }
}
