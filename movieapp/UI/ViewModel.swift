//
//  ViewModel.swift
//  movieapp
//
//  Created by Andi on 27.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import SwiftUI

protocol ViewModel {
    func ratingForMovieId(id: Int) -> Int
    func updateFavorites(id: Int)
}
