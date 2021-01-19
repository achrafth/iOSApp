//
//  ContentView.swift
//  Custom Segment
//
//  Created by Kavsoft on 14/02/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//

import SwiftUI
import MapKit

struct ProfileView: View {
    
    @State var selected = 1
    
    var body: some View {
       
        VStack(spacing: 8){
            
            Topbar(selected: self.$selected).padding(.top)
            
            if self.selected == 0{
                
                Homie()
            }
            else{
                
                Account()
            }
            
        }.background(Color("Color00").edgesIgnoringSafeArea(.all))
    
        }
        
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct Topbar : View {
    
    @Binding var selected : Int
    
    var body : some View{
        
        HStack{
            Button(action: {
                self.selected = 0
                
            }) {
                
                Image("msg")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.vertical,12)
                    .padding(.horizontal,30)
                    .background(self.selected == 0 ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 0 ? .green : .gray)
            
            Button(action: {
                
                self.selected = 1
                
            }) {
                
                Image("acc")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.vertical,12)
                .padding(.horizontal,30)
                .background(self.selected == 1 ? Color.white : Color.clear)
                .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 1 ? .green : .gray)
            
            }.padding(8)
            .background(Color("Color22"))
            .clipShape(Capsule())
            .animation(.default)
    }
}

struct Homie : View {
    
    var body : some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15){
                
                ForEach(1...8,id: \.self){i in
                    
                    HStack(spacing: 15){
                        
                        Image("pic").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Catherine")
                            Text("msg \(i)")
                            
                        }
                        
                        Spacer(minLength: 0)
                        
                    }.padding()
                    .background(Color.white)
                }
                
            }.padding()
        }
    }
}



struct MesParticipations : View {
    @State var show = false
    @State var results = [Evenement]()

    func loadDataParts(id:Int) {
        
        
        guard let url = URL(string: "http://127.0.0.1:3000/GetEvenementUser/\(id)") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([Evenement].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                      print(self.results)
                      
                    }
                    return
                }
            }
        }.resume()
    }

/*
          let first = Participant(id_user: 111, id_evenement: 111)
          let second = Participant(id_user: 12, id_evenement: 32)
          let third = Participant(id_user: 20, id_evenement: 43)
    */
          
    
            var body : some View{
                
                HStack{
                ForEach(results, id:\.id_user) { event in

                VStack(alignment: .leading, spacing: 10){

                        Text("Yes")
                            Text("Yes")
                            Text("Yes")
                            Text("Yes")
                    }
                }.onAppear(perform: {self.loadDataParts(id: 222)})
                }
    
    }
}
    /*
                HStack{
                                  
                          ForEach(results, id:\.nom_evenement) { event in

                          
                              //Whole Event Container
                              VStack(alignment: .leading,spacing: 12){
                                  
                                            Button(action: {
                                                self.show.toggle()

                                            }) {
                                                
                                                Image("Card1").renderingMode(.original)
                                                .cornerRadius(20)
                                                .shadow(radius: 20)

                                            }

                                  //Small Text under image
                                            HStack(spacing: 10){
                                              Text(event.nom_evenement).fontWeight(.heavy)
                                                Image("map").renderingMode(.original)
                                              Text(event.location_evenement).foregroundColor(.gray)
                                            }
                                  }
                                      }
                }.onAppear(perform: self.loadDataParts(id: 1))
                
                
                */
                
                
                
                
                
                
                
                
                
                
                
        
        


struct Account : View {
    
    
    
    @State var showingDetail = false

    
    @State var show = false
    @State var results = [Evenement]()

    func loadDataParts(id:Int) {
        
        
        guard let url = URL(string: "http://127.0.0.1:3000/GetEvenementUser/\(id)") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([Evenement].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                      print(self.results)
                      
                    }
                    return
                }
            }
        }.resume()
    }
    
    @State var manager = CLLocationManager()
     @State var alert = false
    
    var body : some View{
        
        VStack(spacing: 20){
            
            HStack(spacing: 15){
                
                Image("apic").renderingMode(.original)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Try")
                    

                }
                
                Spacer()
            }
            
            
            HStack(spacing: 15){
                
                HStack{
                    
                    VStack(alignment: .leading){
                        
                        Text("Hosted").fontWeight(.bold)
                        
                        Text("128").fontWeight(.bold).font(.system(size: 22))
                    }
                    
                    Spacer(minLength: 0)
                    
                }.padding()
                .frame(width: (UIScreen.main.bounds.width - 45) / 2)
                .background(Color("Color1"))
                .cornerRadius(15)
                
                HStack{
                    
                    VStack(alignment: .leading){
                        
                        Text("Joined").fontWeight(.bold)
                        
                        Text("228").fontWeight(.bold).font(.system(size: 22))
                    }
                    
                    Spacer(minLength: 0)
                    
                }.padding()
                .frame(width: (UIScreen.main.bounds.width - 45) / 2)
                    .background(Color.gray)
                .cornerRadius(15)
                
            }.foregroundColor(.white)
             .padding(.top)
            
                       Button(action: {
                           
                           self.showingDetail.toggle()

                       }) {
                           
                           HStack(spacing: 15){
                               
                               Image("map")
                                   .renderingMode(.original)
                                   .padding()
                                   .background(Color.white)
                                   .clipShape(Circle())
                               
                               Text("Mes Participations")
                               
                               Spacer()
                               
                               Image("arrow").renderingMode(.original)
                               
                           }.padding()
                           .background(Color.white)
                           .foregroundColor(.black)
                           
                           
                           
                         
                           
                           
                           
                       }.cornerRadius(15)
                       .padding(.top)
                       .sheet(isPresented: $showingDetail) {
                           MesParticipations()
                           Text("Mes Participations")
                           
                     
                       }
            
            
            
            
            
            Button(action: {
                           
                          

                       }) {
                           
                           HStack(spacing: 15){
                               
                               Image("map")
                                   .renderingMode(.original)
                                   .padding()
                                   .background(Color.white)
                                   .clipShape(Circle())
                              

                            Button(action: {
                            }) {
                                NavigationLink(destination:
                                    
                                    
                                   MapView(manager: $manager, alert: $alert).alert(isPresented: $alert) {
                                                
                                                Alert(title: Text("Please Enable Location Access In Settings Pannel !!!"))
                                            }
                                    
                                    
                                    
                                    
                                    ){
                               Text("Near Me ")
                            }
                               
                               Spacer()
                               
                               Image("arrow").renderingMode(.original)
                            }
                           }.padding()
                           .background(Color.white)
                           .foregroundColor(.black)
                        
            }

            Button(action: {
                
                self.showingDetail.toggle()

            }) {
                
                HStack(spacing: 15){
                    
                    Image("map")
                        .renderingMode(.original)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                    
                    Text("Mes Participations")
                    
                    Spacer()
                    
                    Image("arrow").renderingMode(.original)
                    
                }.padding()
                .background(Color.white)
                .foregroundColor(.black)
                
                
                
              
                
                
                
            }.cornerRadius(15)
            .padding(.top)
            .sheet(isPresented: $showingDetail) {
                MesParticipations()
                Text("Mes Participations")
                
          
            }
            
            
            
            
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 15){
                    
                    Image("world")
                        .renderingMode(.original)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                    
                    Text("Language")
                    
                    Spacer()
                    
                    Image("arrow").renderingMode(.original)
                    
                }.padding()
                .background(Color.white)
                .foregroundColor(.black)
                
            }.cornerRadius(15)
            
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 15){
                    
                    Image("sunset")
                        .renderingMode(.original)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                    NavigationLink(destination: HomeTab()){
                        Text("Check Weather")

                    }
                    
                    Spacer()
                    
                    Image("arrow").renderingMode(.original)
                    
                }.padding()
                .background(Color.white)
                .foregroundColor(.black)
                
            }.cornerRadius(15)
            
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 15){
                    
                    Image("log")
                        .renderingMode(.original)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                    
                    Text("Logout")
                    
                    Spacer()
                    
                    Image("arrow").renderingMode(.original)
                    
                }.padding()
                .background(Color.white)
                .foregroundColor(.black)
                
            }.cornerRadius(15)
            
            Spacer()
            
        }.padding()
        .padding(.top)
    }
}
