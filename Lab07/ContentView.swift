//
//  ContentView.swift
//  Lab07
//
//  Created by Joel Ward on 10/4/24.
//

import SwiftUI

struct ArticleView: View {
    @Environment(ArticleViewModel.self) var news
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(news.model.imageName)
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height / 3)
                Text(news.model.category)
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Text(news.model.title)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: news.model.isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                        .font(.system(size: 0.1 * geometry.size.width))
                        .onTapGesture{
                            news.intent()
                        }
                }
                Text(news.model.text)
                HStack{
                    Link("More...", destination: URL(string: news.model.url)!)

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ArticleView()
        .environment(ArticleViewModel())
}
