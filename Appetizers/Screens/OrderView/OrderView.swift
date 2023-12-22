//
//  OrderView.swift
//  Appetizers
//
//  Created by Rahul Rai on 04/11/23.
//

import SwiftUI

struct OrderView: View {
//    @State private var orderItems = MockData.orderItems
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    // Swipe to delete functionality is coupled with foreach always
                    // therefore used for each with list.... One more thing swipeToDelete works when we have a unique id for each item.
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            order.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    Button{
                        print("Order Placed")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 25)
                }
                if(order.items .isEmpty){
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. Add items to continue ")
                }
            }
            .navigationTitle("🧾Orders")
            
        }

    }
}

#Preview {
    OrderView()
}
