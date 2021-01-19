//
//  Model.swift
//  Restaturant
//
//  Created by Mourad's Mac on 12/4/20.
//  Copyright © 2020 Balaji. All rights reserved.
//

import FBSDKLoginKit
import SwiftUI

import Foundation
struct Userx: Codable  {
   // let id: Int
    let email: String
    let password: String
    
    
    func viewDidLoad() { viewDidLoad();
        
        let loginButton = FBLoginButton();
        
     
    }
}
