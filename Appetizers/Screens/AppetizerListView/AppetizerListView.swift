//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Rahul Rai on 04/11/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var isShowingDetail = false
    // Optional because can be empty in start
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
        
        ZStack{
            NavigationView{
                List(viewModel.appetizers, id: \.id){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }

                .navigationTitle("🍔Appetizers")
                .disabled(isShowingDetail)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                AppetizerDetailView(appetizer: selectedAppetizer!, isShowingDetail: $isShowingDetail)
            }
            
            // Loading view
            if viewModel.isLoading {
                LoadingView()
            }

            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
        
    }
    
}

#Preview {
    AppetizerListView()
}
