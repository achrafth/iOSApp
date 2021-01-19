
//
//  RegisterView.swift
//  Restaturant
//
//  Created by Mourad's Mac on 11/22/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI
import Alamofire
import Combine
import MapKit

struct RegisterView: View {
  //  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var retrieved = ""

    
    var body: some View {

        NavigationView{


        ZStack{
            
            TabView{
                
                BottomNavBar().tabItem {
                    
                    Image("home").font(.title)
                }
                
                AddEvenementView(priceEvent: 3, idUser: 3, nbrPlaceEvent: 3).tabItem {
                    
                    Image("add").font(.title)
                }
                
                TestView().tabItem {
                    
                    Image("search").font(.title)
                }
                /*
                Text("person").tabItem {
                    Image("Setting").font(.title)
                }
                */
                ReminderList().tabItem {
                                          
                 Image("news").font(.title)
                              
                 }
                
                
                
                ProfileView().tabItem {
                                 
                                 Image("Profile").font(.title)
                             }
            }
            /*
               HStack{
                         //Go Back Button
                             Button(action: {
                                    //What i do
                                 self.presentationMode.wrappedValue.dismiss()
                             }) {
                                 //How do i look like
                                     Image(systemName: "arrow.left").resizable().frame(width: 18, height: 15).foregroundColor(.black)
                                    //    Text("Register")
                             }
                                     /*
                                        Image(systemName: "arrow.left").resizable().frame(width: 18, height: 15).foregroundColor(.black)
                 */
                             }.padding()
                             .position(x: 30, y: 30)
 */
        }
                 
      }
        
}
struct BottomNavBar : View {
    
    var body : some View{
        
        
        ZStack{
            
 
        VStack(alignment: .center){

            
          
 
       HStack(alignment: .top){
        Image("shopImage").resizable()
            .padding(5)

            Text("Sporty ").fontWeight(.heavy).font(.largeTitle).padding(.top,10)
                      .foregroundColor(Color("Color1"))
                      .shadow(radius: 70)
            }
            
            HStack{
                Button(action: {
                    
                }) {
                    
                    Text("").fontWeight(.heavy).foregroundColor(.black)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
Text("Today Events").fontWeight(.heavy).foregroundColor(.black)                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("").foregroundColor(.gray)
                }
            }//.padding([.top],80)
                 
                .padding(20)
            .padding(.bottom, 15)
            Text("Football").fontWeight(.light).foregroundColor(.black)

        ScrollView(.horizontal, showsIndicators: true) {

                MiddleView()
           

        
  /*
            Text("Basketball").fontWeight(.light).foregroundColor(.black)
           MiddleView()

            Text("Tennis").fontWeight(.light).foregroundColor(.black)
          
            MiddleView()
 */
            }
           // BottomView().padding(.top, 10)
            
            Text("Basketball").fontWeight(.light).foregroundColor(.black)
                   ScrollView(.horizontal, showsIndicators: true) {

                    MiddleView()

                   
             /*
                       Text("Basketball").fontWeight(.light).foregroundColor(.black)
                      MiddleView()

                       Text("Tennis").fontWeight(.light).foregroundColor(.black)
                     
                       MiddleView()
            */
                       }
        }

        }.foregroundColor(.clear)        // Making rectangle transparent
            .background(LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom))
        
    }
}
    
struct MiddleView : View {
    
    @State var show = false
    @State var results = [Evenement]()
@State var showImage = false
    @State var id = 0
    func loadOneData(id: Int) {
           
         //  guard let url = URL(string: "http://127.0.0.1:3000/GetEvents/\(id)")
        
        print("ID SHOWING" )
        print($id)
        guard let url = URL(string: "http://127.0.0.1:3000/GetEvent/\(id)") else {
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
    //let imgFootball = UIImage(named: "tennis")
    let imgTennis=UIImage(named:"tennis")
    let imgFootball=UIImage(named:"football")
    var body : some View{
            
     
        ScrollView(.horizontal, showsIndicators: false) {
            
            
            
            
            
            HStack(spacing: 15){
                
                
                
            
                    
               
                HStack{
                   

            ForEach(results, id:\.nom_evenement) { event in

            
                //Whole Event Container
                VStack(alignment: .leading,spacing: 12){
                    
                              Button(action: {
                                  self.show.toggle()
                              
                              }) {
                                
                                Image("rugby").renderingMode(.original)
                                  .cornerRadius(20)
                                  .shadow(radius: 20)
                                //.blur(radius: 1)
                    }
                    //Small Text under image
                              HStack(spacing: 10){
                                Text(event.nom_evenement)
                                 .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .onTapGesture {
                                    if(event.type_evenement=="Tennis"){
                                    print("Type SOLO DETECTED")
                                    }else{
                                        if(event.type_evenement=="Rugby"){
                                            print("Type SOLO DETECTED")

                                        }
                                    }
                                }
                                
                            
                            Image("map").renderingMode(.original)
                                
                                Text(event.type_evenement ).foregroundColor(.black)
                                    .fontWeight(.regular)
                                

                                Text(event.location_evenement).foregroundColor(.black)
                                .fontWeight(.light)
                              }
                }
                        }
                          }.onAppear(perform: self.loadData)
               
                             
               /*
                          VStack(alignment: .leading,spacing: 12){
                              
                              Button(action: {
                                  self.show.toggle()

                              }) {
                                  
                                  Image("Card1").renderingMode(.original)
                                  .cornerRadius(20)
                                  .shadow(radius: 30)

                              }
                              
                              
                              HStack(spacing: 10){
                                  Text("Tennis").fontWeight(.heavy)
                                  Image("map").renderingMode(.original)
                                  Text("Tunis, Cité olympique").foregroundColor(.gray)
                              }
 
                          }

            */

        }.sheet(isPresented: $show)
        {
            
            Detail()
        }
            
        }
   
            
    
}
    
      func loadData() {
          guard let url = URL(string: "http://127.0.0.1:3000/GetEvents") else {
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
    
    


struct Detail : View {
    
  //  @Binding var data = Evenement()
    
    var football = true
    var rugby = true
    var tennis = true

     let imgFootball = UIImage(named: "football")

    
    var body : some View{


        VStack(){
        
            
            ZStack{
            Image("rugby").resizable().aspectRatio(1.35, contentMode: .fill).frame(width:UIScreen.main.bounds.width,height: 500).offset(y: -200).padding(.bottom, -200)
            
            }
            
            
            GeometryReader{geo in
                
                VStack(alignment: .leading){
                    
                   //detailTop()
                   VStack(alignment: .leading, spacing: 10){
                          
                          HStack{
                              
                              VStack(alignment: .leading){
                                  
                                  Text("Takwira").fontWeight(.heavy).font(.largeTitle)
                                  
                              }
                              
                              Spacer()
                              
                              Text("7 TND").foregroundColor(Color(.black)).font(.largeTitle)
                          }
                          
                      }.padding()
                    
                  detailBottom()
                    
                }
                
            }.background(Color.white)
            .clipShape(Rounded())
            .padding(.top, -75)
            
            
        }
    }
}

struct detailTop : View {

    var body : some View{
        
        VStack(alignment: .leading, spacing: 10){
            
            HStack{
                
                VStack(alignment: .leading){
                    
                    Text("Takrwira").fontWeight(.heavy).font(.largeTitle)
                    Text("Football").fontWeight(.heavy).font(.largeTitle)
                    
                }
                
                Spacer()
                
                Text("7 TND").foregroundColor(Color(.black)).font(.largeTitle)
            }
            
        }.padding()
    }
}


struct detailMiddle : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            

            HStack(spacing: 5){
                
                Image("map").renderingMode(.original)
                Text("Kecamatan Klojen").foregroundColor(Color(.black))
                
            }
            
            HStack(spacing : 8){
                
                ForEach(0..<5){_ in
                    
                    Image(systemName: "star.fill").font(.body).foregroundColor(.yellow)
                }
            }
      
            
            HStack(spacing: 6){
                
                ForEach(0..<5){i in
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("\(i + 1)").foregroundColor(.white).padding(20)
                        
                    }.background(Color(.gray))
                    .cornerRadius(8)
                }
            }
            
            
        }.padding(.horizontal,15)
    }
}

struct detailBottom : View {
    @State var results = [Evenement]()

    @State var id = 0
    func loadOneData(id: Int) {
           
         //  guard let url = URL(string: "http://127.0.0.1:3000/GetEvents/\(id)")
        print("ID SHOWING" )
        print($id)
        guard let url = URL(string: "http://127.0.0.1:3000/GetEvent/\(id)") else {
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
    
   // @State var data = loadOneData(id: 3)
    func addPart(idu : Int , ide : Int)
     {
        
        let Part = Participant(id_user: idu, id_evenement: ide)
        print(Part)

                   AF.request("http://127.0.0.1:3000/participant/add",
                              method: .post,
                              parameters: Part,
                              encoder: JSONParameterEncoder.default).response { response in
                       debugPrint(response)
                                  print(response)
                   }
              
                           }
    
    
  //  @State var Participation = Participant(id_User: 1, id_Event: 2)
    @State var showsAlert = false

    var body : some View{
        
        VStack(alignment: .leading, spacing: 10){
            
            Text("Description").fontWeight(.heavy)
            Text("Forest Camping Experiences and Meanings Key elements of camping experience include nature, social interaction, and comfort/convenience. The most common associated meanings are restoration, family functioning").foregroundColor(.gray)
            
            HStack(spacing: 8){
                
                Button(action: {
                 
                    
                }) {
                    
                    Image("save").renderingMode(.original)
                }
                
                Button(action:{
                    
                    print("This is loadOneData()")
                }) {
                    
                    HStack(spacing: 6){

                        Button(action: {
                            self.showsAlert = true
                        }) {
                            Text("Show Alert")
                        }
                        .alert(isPresented:$showsAlert) {
                            Alert(title: Text("Are you sure you want to delete this?"), message: Text("There is no undo"), primaryButton: .destructive(Text("Delete")) {
                                    print("Deleting...")
                            }, secondaryButton: .cancel())
                        }
                        
                    
                        
                        Text("Join event")
                            
                            
                            .onTapGesture {
                                self.addPart(idu: 222, ide: 23)
                        }
                        
                        Image("arrow").renderingMode(.original)
                        
                    }.foregroundColor(.white)
                    .padding()
                    
                    
                    }.background(Color("bg"))
                    .cornerRadius(8)
                
                  
                
                }
                
                
            }.padding(.top, 6)
            
               .onAppear(perform:{self.loadOneData(id: 5)})
            
            
          
            
            
        }
   

    
    }
}
    }
    
    


    
    
struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
}
    
    
    
/*
    func loadData() {
        guard let url = URL(string: "http://127.0.0.1:3000/evenement/GetEvents") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([Evenement].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    return
                }
            }
        }.resume()
    }
    }

*/









/*
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()()
    }
}
*/

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
RegisterView()    }
}
