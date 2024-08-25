//
//  LazyLoadingImageView.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 10/08/24.
//

import SwiftUI

struct LazyLoadingImageView: View {
    let url: URL
    
    var body: some View {
        AsyncImage(url:url) { image in
            image
                .resizable()
                .scaledToFit()
        }
    placeholder: {
        ProgressView()
    }
    .frame(height: 200)
    .clipped()
    .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    LazyLoadingImageView(url: URL(string: "https://example.com/image.jpg")!)
}
