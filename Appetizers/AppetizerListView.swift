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
    }
    
}

#Preview {
    AppetizerListView()
}
