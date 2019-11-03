//
//  CustomCellMovie.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import SwiftUI
import Combine

struct CustomCellMovie: View {
    
    var movie: Result
    
    @ObservedObject var remoteImage = RemoteImageUrl()
    
    init(movie: Result) {
        self.movie = movie
        self.remoteImage.getImageFromUrl(movie.artworkUrl100 ?? "")
    }
    
    var body: some View {
        return GeometryReader { geometry in
            VStack {
                Spacer()
                Image(uiImage: ((self.remoteImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.remoteImage.data))!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 270)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 15)
                VStack {
                    Text("\(self.movie.artistName ?? "") \(self.movie.name ?? "")")
                    Text("\(self.movie.kind ?? "")")
                }
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


