//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Rahul Rai on 04/11/23.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack{
            Image("buffalo-chicken-bites")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
                
            VStack(alignment:.leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }

    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.burger)
}
