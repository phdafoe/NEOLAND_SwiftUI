//
//  CustomCellMovie.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import SwiftUI

struct CustomCellMovie: View {
    
    var movie: Result
    
    @ObservedObject var remoteImage = RemoteImageUrl()
    //@ObservedObject var remote = RemoteImageUrl2()
    
    init(movie: Result) {
        self.movie = movie
        self.remoteImage.getImageFromUrl(movie.artworkUrl100 ?? "")
        //self.remote.getImageFromUrl(movie.artworkUrl100 ?? "")
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(uiImage: ((self.remoteImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.remoteImage.data))!)
                .resizable()
                .renderingMode(.original)
                .frame(width: 180, height: 270)
                .cornerRadius(15)
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 8)
            VStack(alignment: .leading) {
                Text("Artist: \(self.movie.artistName ?? "")")
                Text("Name: \(self.movie.name ?? "")")
                Text("Type: \(self.movie.kind ?? "")")
            }.font(.headline)
        }.padding(.leading, 2)
    }
}



