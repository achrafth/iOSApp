//
//  EmailSentView.swift
//  Restaturant
//
//  Created by Mourad's Mac on 11/22/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI

struct EmailSentView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    

    var body: some View {
       
        
        HStack{
        //Go Back Button
            Button(action: {
                   //What i do
                self.presentationMode.wrappedValue.dismiss()

            
            }) {
                //How do i look like
                    Image(systemName: "arrow.left").resizable().frame(width: 18, height: 15).foregroundColor(.black)
                       Text("Email sent")

                       
            }
                    /*
                       Image(systemName: "arrow.left").resizable().frame(width: 18, height: 15).foregroundColor(.black)
*/
            }.padding()
            .position(x: 30, y: 30)
           
       
        }
    }


struct EmailSentView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSentView()
    }
}


