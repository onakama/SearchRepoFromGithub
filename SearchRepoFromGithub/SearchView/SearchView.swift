//
//  SearchView.swift
//  SearchRepoFromGithub
//
//  Created by 住山大誠 on 2022/02/05.
//

import SwiftUI

struct SearchView: View {
    @State private var item = ""
    var body: some View {
        NavigationView {
            VStack {
                TextField("検索キーワード", text: $item)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationLink(destination: ResultView(item: item)) {
                    Text("Search Repository")
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
