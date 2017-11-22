//
//  webViewController.swift
//  Sri
//
//  Created by Suraj B on 7/18/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class webViewController: UIViewController,UIWebViewDelegate {
    
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var web: UIWebView!
    var urlpath : String = ""
    func loadaddressURL() {
        
        let requestURL = URL (string:urlpath)
        let request = URLRequest(url: requestURL!)
        web.loadRequest(request)
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadaddressURL()
        
        web.delegate = self
        
        spinner.hidesWhenStopped = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        spinner.startAnimating()
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        spinner.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        spinner.stopAnimating()
    }
    
}
