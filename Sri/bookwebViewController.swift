//
//  bookwebViewController.swift
//  Sri
//
//  Created by Gowdhaman on 22/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class bookwebViewController: UIViewController,UIWebViewDelegate {
   
    @IBOutlet var bookspinner: UIActivityIndicatorView!

    @IBOutlet weak var webbook : UIWebView!
    
    var urlpath : String = ebooknameArray[songcount]
    func loadaddressURL() {
        
        let requestURL = URL (string:urlpath)
        let request = URLRequest(url: requestURL!)
         webbook.loadRequest(request)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

       bookspinner.hidesWhenStopped = true
       webbook.delegate = self
       loadaddressURL()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        bookspinner.startAnimating()
        return true
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        bookspinner.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        bookspinner.stopAnimating()
    }
    
    

   }
