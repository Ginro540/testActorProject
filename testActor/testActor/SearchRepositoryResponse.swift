//
//  SearchRepositoryResponse.swift
//  testActor
//
//  Created by 古賀貴伍社用 on 2022/03/10.
//
import Foundation

struct SearchRepositoryResponse: Codable {
    let totalCount:Int
    let items:[SearchRepositoryItem]
}

struct SearchRepositoryItem: Codable{
    let id: Int
    let name: String
    let fullName: String
    let owner: GithubUser
    let `private`: Bool
    let description: String?
    let fork: Bool
    let url: String
    let createdAt: Date
    let updatedAt: Date
    let homepage: String?
    let stargazersCount: Int
    let watchersCount: Int
    let language: String?
    let forksCount: Int
    let license: GithubLicense?
}

struct GithubUser: Codable {
    let id: Int
    let login: String
    let avatarUrl: String
    let url: String
    let type: String
}

struct GithubLicense: Codable {
    let key: String
    let name: String
    let url: String?
}
