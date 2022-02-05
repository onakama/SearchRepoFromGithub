//
//  ResultView.swift
//  SearchRepoFromGithub
//
//  Created by 住山大誠 on 2022/02/05.
//

import SwiftUI

struct ResultView: View {
    @State var item: String
    @StateObject var viewModel = ResultViewModel()
    var body: some View {
        NavigationView {
            if viewModel.alertFlg == false {
                List {
                    ForEach(viewModel.repo, id: \.self) { repo in
                        RepositoryView(repository: repo)
                    }
                }
                .alert("アラート", isPresented: $viewModel.alertFlg, actions: {})
            }
        }
        .navigationTitle("SearchResult \(item)")
        .task {
            await viewModel.fetch(item: item)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(item: "hugahuga")
    }
}
