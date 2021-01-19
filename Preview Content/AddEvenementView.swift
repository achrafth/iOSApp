//
//  AddEvenementView.swift
//  Restaturant
//
//  Created by Mourad's Mac on 12/7/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI
import Alamofire
import Combine
import MapKit


struct AddEvenementView: View {

    
    @State private var wakeUp = Date()

    // Change it to class
    @State var nomEvent: String = ""
    @State var descEvent: String = ""
    @State var typeEvent: String = ""
    @State var locationEvent: String = ""
    @State var priceEvent: Int
    @State var infolineEvent: String = ""
    @State var dateEvent = Date()
    @State var idUser: Int
    @State var nbrPlaceEvent: Int
    @State var isActiveNow = false
//FILL INITIALIZER
    
  /*
    var Event = Evenement(nom_evenement:"testing", desc_evenement: "attention", type_evenement: "Riaadhaa", location_evenement: "please", price_evenement: 7, infoline_evenement: "mesh b3id", date_evenement: "2016/10/08 22:31", id_user: 99, nbplace_evenement: 12)
    */
    
    @State var sliderValue = 0.0
    var minimumValue = 0.0
    var maximumvalue = 100.0
    
    @State private var showingAlert = false

    var body: some View {
       
        
        NavigationView {
         
            VStack{
            
              Form {
                Section(header: Text("Primary")){
                    
                
                TextField("Titre", text: $nomEvent)
                TextField("Description", text: $descEvent)

                Picker(selection: $typeEvent, label: Text("Type")) {
                Text("Football").tag(1)
                Text("Rugby").tag(2)
                    
                    
                }
                }
                
                
              
                
                    //Class Call
                //Add Sections to TextFields
                Section(header:Text("Secondary")){
                    

                    DatePicker("Please enter a date", selection: $dateEvent)

                TextField("location", text: $locationEvent)
                         
                TextField("prix", value: $priceEvent,formatter: NumberFormatter( ))
                TextField("userid(for test only)", value: $nbrPlaceEvent,formatter: NumberFormatter( ))
}
                Section(header: Text("Contact")){
                    
                
                  TextField("Infoline", text: $infolineEvent)
                  TextField("iduser", value: $idUser,formatter: NumberFormatter( ))
                }
                
                }
              .navigationBarTitle("Add Event", displayMode: .inline).navigationBarItems(trailing: Button(action: {
                             print("Form Valid: ")
        
                         }){
                             Text("Submit")
                         })
                
                            HStack {
                             //   NavigationLink(destination: RegisterView(), isActive: $isActiveNow){
                                Button(action: {
             self.showingAlert = true

                                let Event = Evenement(nom_evenement:self.nomEvent,
                                desc_evenement: self.descEvent,
                                type_evenement:self.typeEvent,
                                location_evenement:self.locationEvent,
                                price_evenement:self.priceEvent,
                                infoline_evenement: self.infolineEvent,
                                date_evenement: self.dateEvent,
                                id_user: self.idUser,
                                nbplace_evenement: self.nbrPlaceEvent)
                                    
                                    self.loadData(Evenement: Event)
                                   // self.isActiveNow = true
                                    })
                     
                                         {
     
                                            Text("Hit Me !")
                                            
                                         }
                              //  }
       
                            }.padding()
                            // 3.
                        }
    
            }
          
        }
     
        
//Load Class
    func loadData(Evenement:Evenement)
    {
        
        
        
        let Event = Evenement

        if(Event.nom_evenement.isEmpty == true){
            Alert(title:Text("FAILED"))
        }else{
                  AF.request("http://127.0.0.1:3000/evenement/add",
                             method: .post,
                             parameters: Event,
                             encoder: JSONParameterEncoder.default).response { response in
                      debugPrint(response)
                                 print(response)
            }
        }
             
                          }
      

    

}

struct AddEvenementView_Previews: PreviewProvider {
    static var previews: some View {
        AddEvenementView(priceEvent: 3, idUser: 3, nbrPlaceEvent: 3)
    }
}


