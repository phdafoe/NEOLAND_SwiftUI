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
            HStack(alignment: .top) {
                Image(uiImage: ((self.remoteImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.remoteImage.data))!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 270)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 15)
                VStack(alignment: .leading) {
                    Text("Artist: \(self.movie.artistName ?? "")")
                    Text("Name: \(self.movie.name ?? "")")
                    Text("Type: \(self.movie.kind ?? "")")
                }.font(.headline)
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


