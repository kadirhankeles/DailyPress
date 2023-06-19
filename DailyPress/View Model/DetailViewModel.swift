//
//  DetailViewModel.swift
//  DailyPress
//
//  Created by Kadirhan Keles on 19.06.2023.
//

import Foundation

struct DetailViewModel {
    let url: String
    
    init(article: ArticleViewModel) {
        self.url = article.url
    }
}
