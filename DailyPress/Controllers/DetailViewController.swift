//
//  DetailViewController.swift
//  DailyPress
//
//  Created by Kadirhan Keles on 19.06.2023.
//

import Foundation
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    
    var detailVM: DetailViewModel
    private var webView: WKWebView!
    
    init(viewModel: DetailViewModel) {
        self.detailVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .white

        loadURL()
    }

    
    private func setupWebView() {
        
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
    }
    
    private func loadURL() {
        guard let url = URL(string: detailVM.url) else {
            // Handle invalid URL case
            return
        }
        
        DispatchQueue.global(qos: .utility).async {
            let request = URLRequest(url: url)
            
            DispatchQueue.main.async {
                self.webView.navigationDelegate = self
                self.webView.load(request)
            }
        }
    }


}
