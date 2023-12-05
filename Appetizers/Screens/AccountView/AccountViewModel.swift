//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Rahul Rai on 05/12/23.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    
    // Alert Item
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else{
            // Alert
            alertItem = AlertContext.invalidForm
            return false
        }
        guard email.isValidEmail else{
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        
        return true
    }
    
    
    func saveChanges(){
        guard isValidForm else {
            return
        }
        print("Changes have been saved successfully")
    }
    
}
