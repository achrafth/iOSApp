//
//  SearchView.swift
//  Restaturant
//
//  Created by Mourad's Mac on 12/17/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI
import SearchView





struct TestView: View {
    
    let events = ["Takwira", "torh", "Basketball", "", ""]
    @State var data = Evenement.self
   // @State var result:Evenement
    func loadData(nom_evenement:String) {

        
            guard let url = URL(string: "http://127.0.0.1:3000/GetEventByName/\(nom_evenement)") else {
                print("Your API end point is Invalid")
                return
            }
            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode([Evenement].self, from: data) {
                        DispatchQueue.main.async {
                          //  self.result = response
                          print(response)
                            
                            // RegisterView.MiddleView.Detail()
                          
                        }
                        return
                    }
                }
            }.resume()
        }
    

    @State private var searchText : String = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search Events")
                List {
                   ForEach(self.events.filter {
                        self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
                    }, id: \.self) { event in
                      
                        NavigationLink(destination: RegisterView.MiddleView.Detail()){
                        Text(event).onTapGesture {
                            
                            self.loadData(nom_evenement: event)
                        }
                        }
                    }
                }.navigationBarTitle(Text("Events"))
            }
        }
    }
    
    
    
    
    
    
}





struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
