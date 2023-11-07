//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Rahul Rai on 04/11/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.appetizers, id: \.id){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍔Appetizers")
        }
        .onAppear {
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AppetizerListView()
}
