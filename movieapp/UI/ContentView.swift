//
//  ContentView.swift
//  movieapp
//
//  Created by user on 25.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieListView().tabItem {
                Image(systemName: "house")
                Text("Movies")
            }
            FavoritesView().tabItem {
                Image(systemName: "star")
                Text("Favorites")
            }
            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
        .accentColor(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
