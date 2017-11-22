//
//  czwebViewController.swift
//  Sri
//
//  Created by Suraj B on 7/19/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class czwebViewController: UIViewController,UIWebViewDelegate {
       
    @IBOutlet var czspinner: UIActivityIndicatorView!
    

    @IBAction func back(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var webview: UIWebView!
    var urlpath : String = ""
    func loadaddressURL(){
        let requestURL = URL (string:urlpath)
        let request = URLRequest(url: requestURL!)
        webview.loadRequest(request)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadaddressURL()
        
        webview.delegate =  self
        czspinner.hidesWhenStopped = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        czspinner.startAnimating()
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        czspinner.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        czspinner.stopAnimating()
    }

}
