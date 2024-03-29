//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Rahul Rai on 05/12/23.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    
    // Alert Item
    @Published var alertItem: AlertItem?

    func saveChanges(){
        guard isValidForm else {
            return
        }
//        print("Changes have been saved successfully")
        do{
            let data = try JSONEncoder().encode(user)
            userData = data     // Set the data to app storage
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retriveUser(){
        guard let userData = userData else {
            return
        }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else{
            // Alert
            alertItem = AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else{
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        
        return true
    }
    
    

    
}
