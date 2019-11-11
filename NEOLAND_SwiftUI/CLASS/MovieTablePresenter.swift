//
//  MovieTablePresenter.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation

class MovieTablePresenter : MovieTableInteractor, ObservableObject  {
        
    @Published var movies: [Result] = []
    
    internal func getDataFromWeb(){
        movies.removeAll()
        getMoviesInteractor(success: { (moviesEntity) in
            if let feedDes = moviesEntity.feed, let resultsDes = feedDes.results{
               self.movies = resultsDes
            }
        }, failure: { (error) in
            print(error.localizedDescription)
        })
    }
}
