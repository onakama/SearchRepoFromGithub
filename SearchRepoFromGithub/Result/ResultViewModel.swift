//
//  ResultViewModel.swift
//  SearchRepoFromGithub
//
//  Created by 住山大誠 on 2022/02/05.
//

import Foundation

actor ResultViewModel: ObservableObject {
    @MainActor @Published var repo: [Repository] = []
    @MainActor @Published var alertFlg = false
    var message: Error?
    
    func fetch(item: String) async {
        do {
//            let result = try await decode(data: httpGet(item: item))
//            ひとつにできる?。分けると↓
            let data = try await httpGet(item: item)
            let result = try await decode(data: data)
            
            await MainActor.run { [weak self] in
                self?.repo = result
            }
        } catch let error{
            self.message = error
            await MainActor.run { [weak self] in
                self?.alertFlg = true
            }
            print(error)
        }
    }
    
    func httpGet(item: String) async throws -> Data {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(item)") else {
            throw Errors.httpError
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        print(data)
        return data
    }
    func decode(data: Data) async throws -> [Repository]{
        let decoder: JSONDecoder = JSONDecoder()
        guard let decoded = try? decoder.decode(Response.self, from: data) else {
            throw Errors.decodingError
        }
        return decoded.items
    }
    func ImageDownloader() {
        
    }
}
