//
//  CategoryViewModel.swift
//  Albums
//
//  Created by NiteshMeshram on 06/06/25.
//
import Foundation
class CategoryViewModel: ObservableObject {
    
    @Published var category: [Category] = []
    
    @MainActor
    func getCategory() async {
        do {
            let result: [Category] = try await NetworkManager.shared.request(
                urlString: "https://api.escuelajs.co/api/v1/categories",
                responseType: [Category].self,
            )
            self.category = result
        } catch {
            print("Error fetching albums: \(error)")
        }
    }
    
}
