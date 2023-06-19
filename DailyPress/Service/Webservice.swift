//
//  Webservice.swift
//  DailyPress
//
//  Created by Kadirhan Keles on 19.06.2023.
//

import Foundation

class Webservice {
    func fetchArticles(from url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error  {
                print(error.localizedDescription)
                completion(nil)
                
            }else if let data = data {
                do {
                    let articleList = try JSONDecoder().decode(NewsModel.self, from: data)
                    completion(articleList.articles)
                } catch {
                    print("Failed to decode JSON: \(error)")
                    completion(nil)
                }
            }
        }.resume()
    }
}
