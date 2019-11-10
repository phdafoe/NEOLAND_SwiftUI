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
    @ObservedObject var presenter = MovieTablePresenter()
    
    //MARK: - Inicializador de la vista
    init() {
        UITableView.appearance().separatorColor = .clear
        self.presenter.getDataFromWeb()
    }
    //MARK: - Vista
    var body: some View {
        NavigationView{
            List(presenter.movies) { movie in
                CustomCellMovie(movie: movie).frame(height: 300)
            }.navigationBarTitle(Text("Movies from Apple"), displayMode: .large)
        }
    }
}


