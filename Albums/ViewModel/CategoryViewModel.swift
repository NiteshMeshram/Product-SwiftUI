//
//  CategoryViewModel.swift
//  Albums
//
//  Created by NiteshMeshram on 06/06/25.
//
import Foundation
import Combine

@MainActor
final class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchCategories() async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }

        do {
            let endpoint = GetCategoriesEndpoint()
            let response: [Category] = try await NetworkManager.shared.request(endpoint, responseType: [Category].self)

            await MainActor.run {
                self.categories = response
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}
//
//class CategoryViewModel: ObservableObject {
//    @Published var categories: [Category] = []
//    @Published var isLoading: Bool = false
//    @Published var errorMessage: String?
//    /*
//    // Regular Way
//    @MainActor
//    func getCategory() async {
//        do {
//            let result: [Category] = try await NetworkManager.shared.request(
//                urlString: "https://api.escuelajs.co/api/v1/categories",
//                responseType: [Category].self,
//            )
//            self.category = result
//        } catch {
//            print("Error fetching albums: \(error)")
//        }
//    }
//    */
//    // Regular Way
//    /*
//    // Combine Way
//    private var cancellables = Set<AnyCancellable>()
//    func getCategoryCombine() {
//        NetworkManager.shared
//            .requestPublisher(
//                urlString: "https://api.escuelajs.co/api/v1/categories",
//                responseType: [Category].self)
//            .receive(on: DispatchQueue.main) // Ensure UI updates happen on main thread
//            .sink(receiveCompletion: { completion in
//                if case let .failure(error) = completion {
//                    print("Error fetching categories: \(error)")
//                }
//            }, receiveValue: { [weak self] result in
//                self?.category = result
//            })
//            .store(in: &cancellables)
//    }
//    */
//}

