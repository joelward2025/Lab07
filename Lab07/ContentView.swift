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
                Spacer()
                Text(news.model.category)
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                HStack{
                    Text(news.model.title)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Image(systemName: news.model.isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                        .font(.system(size: 0.1 * geometry.size.width))
                        .onTapGesture{
                            news.intent()
                        }
                        .padding(.horizontal)
                }
                Spacer()
                Text(news.model.text)
                    .padding(.horizontal)
                HStack{
                    Link("More...", destination: URL(string: news.model.url)!)
                        .padding(.horizontal)

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
