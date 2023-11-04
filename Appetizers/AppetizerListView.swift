//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Rahul Rai on 04/11/23.
//

import SwiftUI

struct AppetizerListView: View {
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationView{
            List(appetizers, id: \.id){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍔Appetizers")
        }
        .onAppear {
            getAppetizers()
        }
    }
    
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
                    print(error.localizedDescription)
                }
            }
            

        }
    }
    
}

#Preview {
    AppetizerListView()
}
