//
//  FrenchView.swift
//  movieapp
//
//  Created by Natascha Natum on 02.06.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import SwiftUI

struct CulturalView: View {
    
    @ObservedObject var viewModel: MovieViewModel
       
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies.filter { (movie) -> Bool in
                    return movie.originalLanguage != "en"
                }) { movie in
                    NavigationLink(destination: MovieSingleView(movie: movie)) {
                        MovieRow(isFavorite: self.viewModel.isFavorite(id: movie.id),movie: movie, viewModel: self.viewModel)
                    }
                    .padding(.vertical, 13)
                }
            }.navigationBarTitle(Text("Chinese"))
        }
    }
}

struct CulturalView_Previews: PreviewProvider {
    static var previews: some View {
        CulturalView(viewModel: MovieViewModel(provider: nil, movies: ExampleDataProvider.movies))
    }
}
