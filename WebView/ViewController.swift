//
//  ViewController.swift
//  WebView
//
//  Created by Hidayat Abisena on 22/02/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if let url = URL(string: "https://www.livecoinwatch.com/price/Bitcoin-BTC?tab=1") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: webView, action: #selector(webView.goBack))
        let forwardButton = UIBarButtonItem(title: "Forward", style: .plain, target: webView, action: #selector(webView.goForward))
        let reloadButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))

        navigationItem.leftBarButtonItems = [backButton, forwardButton]
        navigationItem.rightBarButtonItems = [reloadButton]
        
    }


}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }
}
