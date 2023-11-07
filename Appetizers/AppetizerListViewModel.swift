//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Rahul Rai on 07/11/23.
//

import Foundation


class AppetizerListViewModel: ObservableObject{
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    // API Call
    func getAppetizers(){
        NetworkManager.shared.getAppetizers { result in
            // Now result is either gonna be a success or a failure
            // Now the network call is happening on a background thread.
            // But on SwiftUI, we need to make network call on the main thread....
            // [REMEMBER] this.....
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error{
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                
//                    print(error.localizedDescription)
                }
            }
            

        }
    }
    
}
