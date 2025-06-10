//
//  ProductCard.swift
//  Albums
//
//  Created by NiteshMeshram on 09/06/25.
//

import SwiftUI

//struct Product: Identifiable {
//    let id = UUID()
//    let name: String
//    let imageName: String // This should match an asset in Assets.xcassets
//}

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.images[0]))
            { phase in
                switch phase {
                case .failure: Image(systemName: "photo") .font(.largeTitle)
                case .success(let image):
                    
                    image.resizable()
                default: ProgressView()
                    
                }
            }
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text(product.title)
                .font(.caption)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(width: 100)
                .padding(.top, 4)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
