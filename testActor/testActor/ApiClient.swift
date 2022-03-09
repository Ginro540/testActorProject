//
//  SwiftUIView.swift
//  testActor
//
//  Created by 古賀貴伍社用 on 2022/03/10.
//

import Foundation

actor ApiClient {
    
    private let session = URLSession.shared
    private let baseUrl: String = "https://api.github.com"
    
    private let decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .iso8601
        return jsonDecoder
    }()
    
    func searchRepository(query: String) async throws -> SearchRepositoryResponse {
        let queryString = query.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: baseUrl + "/search/repositories?q=\(queryString)")!
        let request = URLRequest(url: url)
        let (data,_) = try await session.data(for: request)
        return try decoder.decode(SearchRepositoryResponse.self, from: data)
    }
}
