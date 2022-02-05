//
//  RepositoryView.swift
//  SearchRepoFromGithub
//
//  Created by 住山大誠 on 2022/02/05.
//

import SwiftUI

struct RepositoryView: View {
    var repository: Repository
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: repository.owner.avatar_url)) { phase in
                if let image = phase.image {
                    image.resizable().scaledToFit().frame(width: 50, height: 50)
                } else if let error = phase.error {
                    Text(error.localizedDescription)
                } else {
                    ProgressView()
                        .scaledToFit().frame(width: 50, height: 50)
                    
                }
            }
            Link("\(repository.name)", destination: URL(string: repository.html_url)!)
        }
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(repository: Repository(
            name: "aaaaaa",
            owner: Avatar_url(avatar_url: "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"),
            html_url: "https://github.com/dtrupenn/Tetris"))
    }
}
