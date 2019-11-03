//
//  MovieTableInteractor.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation



class MovieTableInteractor  {
        
    var provider = GenericProvider()
    
    internal func getMoviesInteractor(success: @escaping(MoviesModel) -> (), failure: @escaping(EError) -> ()) {
        self.provider.getMoviesProvider(success: { (entity) in
            success(entity)
        }) { (error) in
            failure(error)
        }
    }
}
