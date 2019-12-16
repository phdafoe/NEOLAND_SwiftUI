//
//  Constants.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation


var CONSTANTS = Constants()

struct Constants {
    let BASE_URL = BaseUrl()
}

struct BaseUrl {
    let BASE_URL_MOVIE = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/10/explicit.json"
}
