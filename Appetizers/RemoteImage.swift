//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Rahul Rai on 10/11/23.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    
    // Optional with default value as nil. Published because we need to broadcast the changes....
    @Published var image: Image? = nil
    
    func load(fromURLString: String) {
        NetworkManager.shared.downloadImage(fromURLString: fromURLString) { uiImage in
            // Unwrap uiImage
            guard let uiImage = uiImage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(systemName: "buffalo-chicken-bites").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}
