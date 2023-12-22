//
//  EmptyState.swift
//  Appetizers
//
//  Created by Rahul Rai on 07/12/23.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)    // Because if message is large it should remain centered
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is my tes ft message.. Lets make it very long for testing.. Something went wrong !!!!")
}
