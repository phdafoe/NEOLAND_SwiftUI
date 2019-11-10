//
//  GenerProvider.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation


class GenericProvider: BaseProvider {
    
    func getMoviesProvider(success: @escaping(MoviesModel) -> (), failure: @escaping(APIError) -> ()) {
        requestGeneric(MoviesModel.self, endpoint: CONSTANTS.BASE_URL.BASE_URL_MOVIE)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        failure(error)
                }
            }) { (data) in
                success(data)
        }.cancel()
    }
}
