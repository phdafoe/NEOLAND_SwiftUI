//
//  MovieTableView.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import SwiftUI


struct MovieTableView: View {
    
    //MARK: - Variables locales
    @ObservedObject var viewModel = MovieTablePresenter()
    
    //MARK: - Inicializador de la vista
    init() {
        UITableView.appearance().separatorColor = .clear
        self.viewModel.getDataFromWeb()
    }
    
    //MARK: - Vista
    var body: some View {
        NavigationView{
            List(viewModel.movies){ movie in
                NavigationLink(destination: DetallePelicula()) {
                    CustomCellMovie(movie: movie).frame(height: 300)
                }
            }.navigationBarTitle(Text("Movies from Apple"), displayMode: .large)
        }
    }
}

struct MovieTableView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTableView()
    }
}


