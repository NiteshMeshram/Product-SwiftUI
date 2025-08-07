//
//  Dashboard.swift
//  Albums
//
//  Created by NiteshMeshram on 06/06/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var categoryViewModel = CategoryViewModel()
    var body: some View {
        NavigationStack {
            List(categoryViewModel.categories) { category in
                HStack {
                    AsyncImage(url: URL(string: category.image))
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
                    VStack(alignment: .leading) {
                        Text("\(category.id)").bold()
                        Text(category.name).bold().font(.title3)
                    }
                }
                NavigationLink(destination: ProductListView(categoryId: category.id)) {
                    //                                  Text(user.name)
                }
            }
            .scrollContentBackground(.hidden)
            .background(.purple)
            .navigationTitle("Photos from API")
            .onAppear {
               /*
                Regular way
                
                Task {
                    await categoryViewModel.getCategory()
                }
                */
                // Combine Way
//                categoryViewModel.getCategoryCombine()
            }
            .task {
                await categoryViewModel.fetchCategories()
            }
        }
    }
}

#Preview {
    DashboardView()
}
