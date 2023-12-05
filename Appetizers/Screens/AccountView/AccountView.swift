//
//  AccountView.swift
//  Appetizers
//
//  Created by Rahul Rai on 04/11/23.
//

import SwiftUI

struct AccountView: View {
    
    // View Model
    @StateObject var viewModel = AccountViewModel()
    
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text:$viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization( .none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", 
                               selection: $viewModel.birthdate,
                               displayedComponents: .date)
                    Button{
//                        print("Save")
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                    
                } header: {
                    Text("Personal Info")
                }
                
                Section{
                    Toggle(isOn: $viewModel.extraNapkins) {
                        Text("Extra Napkins")
                    }
                    Toggle(isOn: $viewModel.frequentRefills) {
                        Text("Frequent Refills")
                    }
                } header: {
                    Text("Requests")
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
            }
            .navigationTitle("Account")
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
            
        }
    }
}

#Preview {
    AccountView()
}
