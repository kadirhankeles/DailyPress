//
//  NewsViewModel.swift
//  DailyPress
//
//  Created by Kadirhan Keles on 18.06.2023.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
    
    var numberOfSections: Int {
        return 1
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func atIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article: article)
    }
    
}

struct ArticleViewModel {
    let title: String
    let description: String
    let urlToImage: String
    let url: String
    
    init(article: Article) {
        self.title = article.title ?? ""
        self.description = article.description ?? ""
        self.urlToImage = article.urlToImage ?? ""
        self.url = article.url ?? ""
    }
}
