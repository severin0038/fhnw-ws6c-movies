//
//  FavoritesView.swift
//  movieapp
//
//  Created by Andi on 26.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    @ObservedObject var viewModel: FavoritesViewModel
    
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.favoriteMovies) { movie in
                    MovieRow(isFavorite: self.viewModel.isFavorite(id: movie.id),movie: movie, viewModel: self.viewModel)
                        .padding(.vertical, 13)
                }
            }
            .navigationBarTitle(Text("Favorites"))
            .onAppear() {
                self.viewModel.loadNewMovies()
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: FavoritesViewModel())
    }
}
