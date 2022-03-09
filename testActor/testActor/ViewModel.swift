//
//  ViewModel.swift
//  testActor
//
//  Created by 古賀貴伍社用 on 2022/03/10.
//

import Foundation

actor ViewModel:ObservableObject {
    
    // @MainActor メインスレッドで参照する必要がある為　宣言が必要
    @MainActor @Published var message: String?
    
    var count: Int = 0
    
    func fetchMessage(url: String) async -> String? {
        do {
            try await Task.sleep(nanoseconds: (1 * 1000 * 1000 * 1000))
        } catch {
            return ""
        }
        count += 1
        let result = url + "?count\(count)"
        print("1 -> \(Thread.isMainThread)")
        await MainActor.run { [weak self] in
            print("2 -> \(Thread.isMainThread)")
            self?.message = result
        }
        return result
    }
}
