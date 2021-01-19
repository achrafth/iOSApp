//
//  SearchView.swift
//  Restaturant
//
//  Created by Mourad's Mac on 12/17/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI
import SearchView

struct SearchView: View {
    
    let cars = ["Subaru WRX", "Tesla Model 3",
                       "Porsche 911", "Renault Zoe", "DeLorean"]
    var body: some View {
            
    

               NavigationView {
                   List {
                       ForEach(self.cars, id: \.self) { car in
                           Text(car)
                       }
                   }.navigationBarTitle(Text("Cars"))
               }
           }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
