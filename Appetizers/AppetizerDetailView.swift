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
                    VStack(spacing: 5){
                        Text("Calories")
                            .font(.caption)
                            .fontWeight(.bold)
                        Text("\(appetizer.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 5){
                        Text("Carbs")
                            .font(.caption)
                            .fontWeight(.bold)
                        Text("\(appetizer.carbs)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 5){
                        Text("Protien")
                            .font(.caption)
                            .fontWeight(.bold)
                        Text("\(appetizer.protein)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
                
            }
            Spacer()
            
            Button{
                print("Tapped")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color("brandPrimary"))
                    .cornerRadius(10)
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
            ZStack{
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
            }

        }, alignment: .topTrailing)
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.chickenWings, isShowingDetail: .constant(true))
}
 
