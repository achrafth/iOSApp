//
//  Evenement.swift
//  Restaturant
//
//  Created by Mourad's Mac on 12/7/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import Foundation

struct Evenement: Codable {
    let nom_evenement: String
    let desc_evenement: String
    let type_evenement: String
    let location_evenement: String
    let price_evenement: Int
    let infoline_evenement: String
    let date_evenement = Date()
    let id_user: Int
    let nbplace_evenement: Int

    
    init(nom_evenement: String, desc_evenement:String ,type_evenement: String,location_evenement:String,price_evenement:Int,infoline_evenement:String,date_evenement:Date
        ,id_user:Int,nbplace_evenement:Int)
    {
          // self.id_evenement:nil
           self.nom_evenement = nom_evenement
           self.desc_evenement = desc_evenement
           self.type_evenement = type_evenement
           self.location_evenement = location_evenement
           self.price_evenement = price_evenement
           self.infoline_evenement = infoline_evenement
          // self.date_evenement = date_evenement
           self.id_user = id_user
           self.nbplace_evenement = nbplace_evenement

       }
    
    
    
}
