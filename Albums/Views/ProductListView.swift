//
//  ProductListView.swift
//  Albums
//
//  Created by NiteshMeshram on 09/06/25.
//

import SwiftUI

struct ProductListView: View {
    let categoryId: Int
    @StateObject private var productViewModel = ProductViewModel()
    
    
    var body: some View {
        
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(productViewModel.products) { product in
                    ProductCard(product: product)
                }
            }
            .padding()
        }
        
        .onAppear {
            Task {
                await productViewModel.getProducts(forCategoryId: categoryId)
            }
        }
        
        
        
    }
    
}

#Preview {
    ProductListView(categoryId: 10)
}
