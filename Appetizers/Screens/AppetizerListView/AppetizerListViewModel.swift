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
    @Published var isLoading = false
    @Published var isShowingDetail = false
    // Optional because can be empty in start
    @Published var selectedAppetizer: Appetizer?
    
    // API Call
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            // Now result is either gonna be a success or a failure
            // Now the network call is happening on a background thread.
            // But on SwiftUI, we need to make network call on the main thread....
            // [REMEMBER] this.....
            DispatchQueue.main.async {
                self.isLoading = false
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
