//
//  ResultView.swift
//  SearchRepoFromGithub
//
//  Created by 住山大誠 on 2022/02/05.
//

import SwiftUI

struct ResultView: View {
    @State var item: String
    @State private var errorFlg: Bool = false
    @State var errorMessage: Error?
    @StateObject var viewModel = ResultViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.repo, id: \.self) { repo in
                    RepositoryView(repository: repo)
                }
            }
            .alert("アラート", isPresented: $errorFlg, actions: {})
        }
        .navigationTitle("SearchResult \(item)")
        .task {
            do {
                try await viewModel.fatch(item: item)
            } catch let error{
                self.errorFlg = true
                self.errorMessage = error
                print(error)
            }

        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(item: "hugahuga")
    }
}
