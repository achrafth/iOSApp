//
//  WelcomePageView.swift
//  Restaturant
//
//  Created by Mourad's Mac on 11/22/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI
import UserNotifications

struct WelcomePageView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var index = 0
    
    let preferences = UserDefaults.standard
    let currentLevelKey = "Username"
    
    var body: some View {


        ZStack{
      
            HStack{
 
                             //Go Back Button
                                 Button(action: {
                                        //What i do
                                     self.presentationMode.wrappedValue.dismiss()
                                 }) {
                                     //How do i look like
                                         Image(systemName: "arrow.left").resizable().frame(width: 18, height: 15).foregroundColor(.black)
                                 }
                       

                   }.padding()
                   .position(x: 30, y: 30)
                .onAppear(perform: {
                    
                    
                      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                                                            if success {
                                                                                print("All set!")
                                                                            } else if let error = error {
                                                                                print(error.localizedDescription)
                                                                            }
                    }
                           
                    if self.preferences.string(forKey: self.currentLevelKey) == nil {
                    print("FAILED !")
                        
                    } else {
                        let currentLevel = self.preferences.value(forKey: self.currentLevelKey)
                        print(self.preferences.string(forKey: self.currentLevelKey))
                    }
                    
                })
                   
                   
                 
                   VStack{
                    
                  
                    
                    
                             HStack{
                                 Text("")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                                 Spacer(minLength: 0)
                             }.padding(.horizontal)
                    //Tab View...
                    
                    HStack(spacing :0)
                    {
            
                    Spacer(minLength: 0)

                        Text("Types")
                        .foregroundColor(self.index == 1 ? .white : Color("Color").opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical,10)
                        .padding(.horizontal,35)
                        .background(Color("Color").opacity(self.index == 1 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            
                            withAnimation(.default){
                            
                                self.index = 1
                            }
                        }
                        Spacer(minLength: 0)
        }
                   .background(Color.black.opacity(0.06))
                   .clipShape(Capsule())
                   .padding(.horizontal)
                   .padding(.top,25)
                   

           // DashBoard Grid....
       
           // Tab View With Swipe Gestures....
           
           // connecting index with tabview for tab change...
                    
                    TabView(selection: self.$index){

                                 // week data..
                   
                                 GridView(fitness_Data: fit_Data)
                                     .tag(0)

                             }
                    
                             //.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                             
                             Spacer(minLength: 0)
                    }
                   .padding(.top)
        
    }
        }
    
    struct GridView : View {
      
        var fitness_Data : [Fitness]
      //  var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
        @State private var showConnectionAlert = false

        var body: some View{
            
            ScrollView (.vertical, showsIndicators: false){

            VStack(){

                ForEach(fitness_Data){fitness in
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text(fitness.title)
                                .foregroundColor(.white)
                            
                            Text(fitness.data)
                                .font(.title)
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .padding(.top,10)
                                .shadow(radius: 30)
                            HStack{
                                
                                Spacer(minLength: 0)
                                
                                Text(fitness.suggest)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        
                        // image name same as color name....
                        .background(Color(fitness.image))

                            
                        .cornerRadius(20)
                            .padding(7)
                        .shadow(radius: 30)
                        // shadow....
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        
                        // top Image....
                        
                        Image(fitness.image)
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .clipShape(Circle())
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top,25)

                

                VStack(){

                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                           // Button(action: { NavigationLink(destination: RegisterView()) }) {

                            VStack(alignment: .leading, spacing: 20) {
                                Button(action: {
                                                }) {
                                                    NavigationLink(destination: RegisterView()){
                                Text("NEXT")
                                    .foregroundColor(.gray)
                                
                                Text("Skip to Shop")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .padding(.top,10)
                                    .shadow(radius: 30)
                                    .foregroundColor(Color(.gray))
                                    
                                HStack{
                                    
                                    Spacer(minLength: 0)
                                    
                                    Text("Skip")
                                        .foregroundColor(Color(.gray))
                                }
                                }.shadow(radius: 90)
                            }
                            }
                            .padding()
                    }
                        }
                            // image name same as color name....
                           // .background(Color(fitness.image))

                            .cornerRadius(20)
                                .padding(7)
                            .shadow(radius: 30)
                            // shadow....
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            
                            // top Image....
                            
                            Image("rightarrow")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.12))
                                .clipShape(Circle())
                    
        
            }.padding(.horizontal)
            .padding(.top,25)
            
        }
    }
}
     
        
        

    


    // DashBoard Grid Model Data...
        
    struct Fitness : Identifiable {
        
        var id : Int
        var title : String
        var image : String
        var data: String
        var suggest : String
    }

    // Daily Data...

    var fit_Data = [

        Fitness(id: 0, title: "Individual Game", image: "user", data: "Individual Game", suggest: "YOU"),

        Fitness(id: 1, title: "Collective Game", image: "users", data: "Collective Game", suggest: " For TEAMS"),
        
        Fitness(id: 3, title: "Kids Game", image: "kids", data: "For Kids 5+",suggest: "For Kids 5+"),
     
        
      
    ]

    // Monthly Data...

    
    
    
    
    
    
    
struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}




