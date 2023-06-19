//
//  NewsListTableViewController.swift
//  DailyPress
//
//  Created by Kadirhan Keles on 18.06.2023.
//

import UIKit
import SDWebImage
class NewsListTableViewController: UITableViewController {
    
    private var newsVM: ArticleListViewModel!
    private let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=bc892d6a6c154fc1a3b9d16dc173dbd2")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeApperance()
        setupViews()
    }
    
    private func setupViews() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        
        Webservice().fetchArticles(from: url) { [weak self] articles in
            if let articles = articles {
                self!.newsVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self!.tableView.reloadData()
                }
            }
        }
    }
    
    private func customizeApperance() {
        title = "Daily Press"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
    }
}

extension NewsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.newsVM == nil ? 0 : self.newsVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.newsVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        let newVM = self.newsVM.atIndex(indexPath.row)
        if let imageURL = URL(string: newVM.urlToImage) {
            cell.newsImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "noImage"))
        }
        cell.titleLabel.text = newVM.title
        cell.descLabel.text = newVM.description
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = newsVM.atIndex(indexPath.row)
        let detailVM = DetailViewModel(article: selectedArticle)
        let detailVC = DetailViewController(viewModel: detailVM)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
