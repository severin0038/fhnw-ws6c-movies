//
//  NetworkManager.swift
//  movieapp
//
//  Created by Andi on 26.05.20.
//  Copyright © 2020 fhnw-ws6c. All rights reserved.
//

import Foundation
import Moya

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

struct NetworkManager: Network {
    
    let provider = MoyaProvider<TheMovieDB_Api>(plugins: [NetworkLoggerPlugin(verbose: false)])
    
    func getNewMovies(page: Int, completion: @escaping ([Movie])->()){
        provider.request(.newMovies(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Results.self, from: response.data)
                    completion(results.movies)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getPopularMovies(page: Int, completion: @escaping ([Movie])->()){
        
        provider.request(.popular(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Results.self, from: response.data)
                    completion(results.movies)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getMoviesWithActors(actorIds: [Int], completion: @escaping ([Movie]) -> ()) {
        
        provider.request(.actor(ids: actorIds)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(Results.self, from: response.data)
                    completion(result.movies)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}

