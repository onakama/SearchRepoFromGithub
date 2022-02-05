//
//  RepositoryModel.swift
//  SearchRepoFromGithub
//
//  Created by 住山大誠 on 2022/02/05.
//

import Foundation

enum Errors: Error {
    case httpError
    case decodingError
}

struct Response: Codable{
    let total_count: Int
    let incomplete_results: Bool
    let items: [Repository]
}

struct Repository: Codable, Hashable {
    let name: String
}


