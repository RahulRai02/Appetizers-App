//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Rahul Rai on 16/11/23.
//

import Foundation
import SwiftUI

struct AppetizerDetailView: View{
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View{
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            // Text information
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
                
            }
            Spacer()
            
            Button{
                print("Tapped")
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
            
        }
        
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 40)
//        .overlay(Text("Hiiii"),s alignment: .topTrailing)
        .overlay(Button{
//            print("dismiss")
            isShowingDetail = false
        }label: {
            XDismissButton()
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.chickenWings, isShowingDetail: .constant(true))
}
 

struct NutritionInfo: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
