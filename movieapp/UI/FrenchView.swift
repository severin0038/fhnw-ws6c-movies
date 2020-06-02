//
//  FrenchView.swift
//  movieapp
//
//  Created by Natascha Natum on 02.06.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import SwiftUI

struct ChineseView: View {
    
    @ObservedObject var viewModel: MovieViewModel
       
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies.filter { (movie) -> Bool in
                    return movie.originalLanguage == "zh"
                }) { movie in
                    MovieRow(isFavorite: self.viewModel.isFavorite(id: movie.id),movie: movie, viewModel: self.viewModel)
                    .padding(.vertical, 13)
                }
            }.navigationBarTitle(Text("Chinese"))
        }
    }
}

struct FrenchView_Previews: PreviewProvider {
    static var previews: some View {
        ChineseView(viewModel: MovieViewModel(provider: nil, movies: ExampleDataProvider.movies))
    }
}
