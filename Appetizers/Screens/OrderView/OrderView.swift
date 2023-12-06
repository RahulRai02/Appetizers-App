//
//  OrderView.swift
//  Appetizers
//
//  Created by Rahul Rai on 04/11/23.
//

import SwiftUI

struct OrderView: View {
    var body: some View {

        NavigationView{
            VStack{
                // Swipe to delete functionality is coupled with foreach always
                // therefore used for each with list.... One more thing swipeToDelete works when we have a unique id for each item.
                List{
                    ForEach(MockData.orderItems){ appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                }
                .listStyle(PlainListStyle())
                Button{
                    print("Order Placed")
                } label: {
                    APButton(title: "$99.99 - Place Order")
                }
                .padding(.bottom, 25)
                
                
            }
                .navigationTitle("🧾Orders")
        }

    }
}

#Preview {
    OrderView()
}
