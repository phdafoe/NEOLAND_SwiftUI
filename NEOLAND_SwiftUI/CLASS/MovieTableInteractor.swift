//
//  MovieTableInteractor.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation

class MovieTableInteractor : GenericProvider  {
            
    internal func getMoviesInteractor(success: @escaping(MoviesModel) -> (), failure: @escaping(APIError) -> ()) {
        getMoviesProvider(success: { (entity) in
            success(entity)
        }) { (error) in
            failure(error)
        }
    }
}
