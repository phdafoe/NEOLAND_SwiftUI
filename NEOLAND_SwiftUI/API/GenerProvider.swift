//
//  GenerProvider.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation


class GenericProvider: BaseProvider {
    
    func getMoviesProvider(success: @escaping(MoviesModel) -> (), failure: @escaping(EError) -> ()) {
        request(entityClass: MoviesModel.self,
                endpoint: CONSTANTS.BASE_URL.BASE_URL_MOVIE,
                method: .get, success: { (entity) in
            success(entity)
        }) { (error) in
            failure(error)
        }
    }
}
