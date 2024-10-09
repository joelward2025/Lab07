//
//  Lab07App.swift
//  Lab07
//
//  Created by Joel Ward on 10/4/24.
//

import SwiftUI

@main
struct Lab07App: App {
    @State var articleManger = ArticleViewModel()
    var body: some Scene {
        WindowGroup {
            ArticleView()
                .environment(articleManger)
        }
    }
}
