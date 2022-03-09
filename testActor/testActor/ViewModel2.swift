//
//  ViewModel2.swift
//  testActor
//
//  Created by 古賀貴伍社用 on 2022/03/10.
//

import Foundation
import Combine

@MainActor
class ViewModel2: ObservableObject {
    
    @Published var query: String = ""
    @Published var item: [SearchRepositoryItem] = []
    @Published var loading: Bool = false
    @Published var hasError: Bool = false
    @Published var errorMessage: String = ""
    
    private var cancellations = Set<AnyCancellable>()
    private var apiClient = ApiClient()
    
    init(){
        
        $query
            .debounce(for: 1.0, scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in self?.doSearch(text: $0) })
            .store(in: &cancellations)
    }
}

private extension ViewModel2 {
    
    func doSearch(text:String) {
        if text.isEmpty {
            return
        }
        
        Task {
            self.loading = true
            do {
                let response = try await apiClient.searchRepository(query: text)
                self.item = response.items
                self.hasError = false
            } catch {
                self.hasError = true
                self.errorMessage = error.localizedDescription
            }
            self.loading = false
        }
    }
}



