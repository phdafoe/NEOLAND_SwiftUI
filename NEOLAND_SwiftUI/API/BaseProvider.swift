//
//  BaseProvider.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation
import Combine

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}

class BaseProvider {
    
    /// requestGeneric
    /// - Parameter entityClass: generic entity Class
    /// - Parameter endpoint: genric endpoint
    func requestGeneric<T: Decodable>(_ entityClass : T.Type, endpoint: String) -> AnyPublisher<T, APIError> {
        
        guard let url = URL(string: endpoint) else {
            preconditionFailure()
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: entityClass.self, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

