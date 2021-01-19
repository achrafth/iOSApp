//
//  ContentView.swift
//  Restaturant
//
//  Created by Kavsoft on 05/03/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//



// Swift // // Ajoutez ceci à l’en-tête de votre fichier, p. ex. dans ViewController.swift import FBSDKLoginKit // Ajoutez ceci à la classe de corps ViewController : UIViewController {  }





// Swift // // Ajoutez ceci à l’en-tête de votre fichier, p. ex. dans ViewController.swift
import FBSDKLoginKit
import SwiftUI
import Alamofire
import MapKit
import CoreData
import UserNotifications




struct ContentView: View {
    @EnvironmentObject var userAuth: UserAuth

    
    @State var results = [Userx]()
    @State private var email: String = "mohsen@mail.com"
    @State private var password: String = "mohsen"


    var body: some View {
        
       
        NavigationView{

            Home()
            .navigationBarTitle("Sporty")
            .navigationBarHidden(true)
             
            }
        
       
    }

    
}



//Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//Home Start
struct Home : View {
    
    @State var results = [Userx]()
    @State var user = ""
    @State var pass = ""
    @State var show = false
    @State var manager = CLLocationManager()
     @State var alert = false
 //   var userTest = User.self
    @State var attemptingLogin = false
    @State var isActive = false
    @EnvironmentObject var userAuth: UserAuth


    
    // Swift // // SceneDelegate.swift func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) { guard let url = URLContexts.first?.url else { return } ApplicationDelegate.shared.application( UIApplication.shared, open: url, sourceApplication: nil, annotation: [UIApplication.OpenURLOptionsKey.annotation] ) }


    @State var numb = UserDefaults.standard.string(forKey: "numb")
    @State var username = ""
    @State var retrieved = ""
    var body : some View{
        ZStack{
            NavigationLink(destination: Register(show: self.$show), isActive: self.$show) {
                EmptyView()

            }
            
            VStack{
                
                HStack{
                    
                    Spacer()
                    
                    Image("shape")
                }
                
                VStack{
                    
                    Image("logo")
                    Image("name").padding(.top,10)
                    
                }.offset(y: -122)
                .padding(.bottom,-132)
                
                VStack(spacing: 20){
                    
                    Text("Sporty").font(.title).fontWeight(.bold)
                    .shadow(radius: 40)

                    
                    Text("Sign Into Your Account")
                        .fontWeight(.bold)
                        .shadow(radius: 40)
                    
                    CustomTF(value: self.$user, isemail: true)
                     
                    CustomTF(value: self.$pass, isemail: false)
                     Text(" USERNAME "+retrieved)
                    HStack{
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("Forget Password ?").foregroundColor(Color.black.opacity(0.5))
                        }
                    }
                    HStack{
                        NavigationLink(destination: WelcomePageView(),isActive: $isActive){

                        Button(action: {

                            self.attemptingLogin = true
                            self.loadData(email: self.user, password: self.pass)
                            
                
                            UserDefaults.standard.set(self.username,forKey: "Username")
                            self.retrieved = self.user
                        })
                        {
  
                            Text("Login")
                                .frame(width: UIScreen.main.bounds.width - 100)
                                .padding(.vertical)
                                .foregroundColor(.white)
                            
                            
                        }.background(Color("Color1"))
                        .clipShape(Capsule())
                            .shadow(radius: 50)
                        }
                    }.onAppear{
                        guard let retrievedusername = UserDefaults.standard.value(forKey: "Username") else{return}
                        self.retrieved = retrievedusername as! String
                    }
                  
                    /*
 HStack{
                                    Button(action: {
                                    }) {
                                        NavigationLink(destination:
                                            
                                            
                                           MapView(manager: $manager, alert: $alert).alert(isPresented: $alert) {
                                                        
                                                        Alert(title: Text("Please Enable Location Access In Settings Pannel !!!"))
                                                    }
                                            
                                            
                                            
                                            
                                            ){
                                        Text("Login")
                                            .frame(width: UIScreen.main.bounds.width - 100)
                                            .padding(.vertical)
                                            .foregroundColor(.white)
                                        
                                    }.background(Color("Color1"))
                                    .clipShape(Capsule())
                                        .shadow(radius: 50)
                                    }
  
                                }
                    
                    
                         HStack{
                                                      
                                                      Button(action: {
                                                      }) {
                                                          NavigationLink(destination:
                                                              
                                                              
                                                            LoginView().alert(isPresented: $alert) {
                                                                          
                                                                          Alert(title: Text("Please Enable Location Access In Settings Pannel !!!"))
                                                                      }
                 
                                                              ){
                                                          Text("Chat").bold()
                                                              .frame(width: UIScreen.main.bounds.width - 100)
                                                              .padding(.vertical)
                                                              .foregroundColor(.white)
                                                          
                                                      }.background(Color("Color1"))
                                                      .clipShape(Capsule())
                                                          .shadow(radius: 50)
                                                      }
                    
                                                  }
        */
                    Text("Or Login Using Social Media").fontWeight(.bold)
                    
                    SocialMedia()
                    
                }.padding()
                .background(Color.white)
                .cornerRadius(5)
                .padding()
                
                HStack{
                    
                    Text("Don't Have an Account ?")
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Text("Register Now").foregroundColor(Color("Color1"))
                         .shadow(radius: 50)
                    }
                    
                }.padding(.top)
                
                Spacer(minLength: 0)
                
            }.edgesIgnoringSafeArea(.top)
            .background(Color("ColorWhite").edgesIgnoringSafeArea(.all))
        }
    }
    
    

    
    
    
    func loadData(email:String,password:String) {
        let user = Userx(email:email, password:password)
        // @State let retour = false
         isActive = false
        var eventsArray = [Userx]()

         AF.request("http://127.0.0.1:3000/login",
                    method: .post,
                    parameters: user,
                    encoder: JSONParameterEncoder.default).responseJSON { response in
                       
                
                        switch response.result {
                        case .success(let JSON):
                            

                            print("Success with JSON: \(JSON)")
                            self.isActive = true
                            print(UserDefaults.standard.set(email ,forKey: "numb"))

                            _ = JSON as! NSDictionary

                            //example if there is an id
                        //    let userId = response.objectForKey("id")!
        
                        case .failure(let error):
                            self.isActive = false

                            print("Request failed with error: \(error)")
                        }
                      //  if( case = .success)
  
            // debugPrint(response)
         //    print(response)
                       
         }
                                    }

}
//Social Media
struct SocialMedia : View {
    //func viewDidLoad() { viewDidLoad(); _ = FBLoginButton(); }

    var body : some View{

        HStack(spacing: 40){

            Button(action: {

            }) {
                
                Image("fb").renderingMode(.original)
            }
            
            Button(action: {
                
                
            }) {
                
                Image("twitter").renderingMode(.original)
            }
        }
    }
}

//TextFields
struct CustomTF : View {
    
    @Binding var value : String
    var isusername = false
    var isemail = false
    var reenter = false
    
    var body : some View{
        
        VStack(spacing: 8){
            
            HStack{
                
                Text(self.isemail ? "Email ID" : self.reenter ? "Re-Enter" :  "Password").foregroundColor(Color.black.opacity(0.3))
        
                Spacer()
            }
            
            
            
            HStack{
                
                if self.isemail{
                    
                    TextField("", text: self.$value)
                }
                else{
                    
                    SecureField("", text: self.$value)
                }
                
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: self.isemail ? "envelope.fill" : "eye.slash.fill").foregroundColor(Color("Color1"))
                }
            }
            
            Divider()
        }
    }
}
//Register View
struct Register : View {
    
   // @State var user = ""
    @State var pass = ""
    @State var email = ""
  //  @State var repass = ""
    @State var agree = false
    @Binding var show : Bool
    
    
    
    func loadDataRegister(emailvar:String,passwordvar:String) {
             let user = Userx(email:emailvar, password:passwordvar)
            // @State let retour = false
              
              AF.request("http://127.0.0.1:3000/registerUser",
                         method: .post,
                         parameters: user,
                         encoder: JSONParameterEncoder.default).responseJSON { response in
                            
                                 
                                 //example if there is an id
                             //    let userId = response.objectForKey("id")!
             
                             
                           //  if( case = .success)
       
                  debugPrint(response)
                 print(response)
                            
              }
}
    
    var body : some View{
        
     
        ZStack(alignment: .topLeading) {
            
            VStack{
                
                HStack{
                    
                    Spacer()
                    
                    Image("shape")
                }
                
                VStack{
                    
                    Image("logo")
                    Image("name").padding(.top,10)
                    
                }.offset(y: -122)
                .padding(.bottom,-132)
                
                VStack(spacing: 20){
                    
                    Text("Sporty").font(.title).fontWeight(.bold)
                    
                    Text("Sign Into Your Account").fontWeight(.bold)
                    
                    //CustomTF(value: self.$user, isusername: true)
                    
                    CustomTF(value: self.$email, isemail: true)

                    CustomTF(value: self.$pass, isemail: false)
                    

                 //   CustomTF(value: self.$repass, isemail: false,reenter: true)
                    
                    HStack{
                        
                        Button(action: {
                            
                            self.agree.toggle()
                            
                        }) {
                            
                            ZStack{
                                
                                Circle().fill(Color.black.opacity(0.05)).frame(width: 20, height: 20)
                                
                                if self.agree{
                                    
                                    Image("check").resizable().frame(width: 10, height: 10)
                                        .foregroundColor(Color("Color1"))
                                }
                            }
                            
                        }
                        
                        Text("I Read And Agree The Terms And Conditions").font(.caption)
                            .foregroundColor(Color.black.opacity(0.1))
                        
                        Spacer()

                    }
                    
                    
                    
                    
                    

                    
                    

                    Button(action:{
                        
                        self.loadDataRegister(emailvar: self.email, passwordvar: self.pass)
                        
                    }
      
                    ) {
                        //NavigationLink(destination: EmailSentView()){
                        Text("Register Now")
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .padding(.vertical)
                            .foregroundColor(.white)
                        .shadow(radius: 20)
                        
                    
                    }.background(Color("Color1"))
                    .clipShape(Capsule())
                    
                    
                    
                    
                    Text("Or Register Using Social Media").fontWeight(.bold)
                    
                    SocialMedia()
                    
                }.padding()
                .background(Color.white)
                .cornerRadius(5)
                .padding()
                
                
                Spacer(minLength: 0)
                
            }.edgesIgnoringSafeArea(.top)
            .background(Color("ColorWhite").edgesIgnoringSafeArea(.all))
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image(systemName: "arrow.left").resizable().frame(width: 18, height: 15).foregroundColor(.black)
                
            }.padding()
            
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
}

