//
//  bookwebViewController.swift
//  Sri
//
//  Created by Gowdhaman on 22/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD


class bookwebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var bookspinner: UIActivityIndicatorView!

    @IBOutlet weak var webbook : UIWebView!
    
    
    var urlpath : String = ebooknameArray[songcount]
    func loadaddressURL() {
        
        let requestURL = URL (string:urlpath)
        let request = URLRequest(url: requestURL!)
         webbook.loadRequest(request)
        downloadPDFFile(urlString: urlpath)
      
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
    

    func downloadPDFFile(urlString:String)
        
    {

        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)

        hud.mode = MBProgressHUDMode.annularDeterminate

        hud.label.text = "Loading"

        let destination: DownloadRequest.DownloadFileDestination = { _, _ in

            let documentsURL:NSURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as    NSURL

            print(documentsURL)

            let PDF_name : String = "Downloded_PDF_Name"

            let fileURL = documentsURL.appendingPathComponent(PDF_name)

            print(fileURL ?? "")

            return (fileURL!,[.removePreviousFile, .createIntermediateDirectories])

        }

        Alamofire.download(urlString, to: destination).downloadProgress(closure: { (prog) in

            hud.progress = Float(prog.fractionCompleted)

        }).response { response in



            hud.hide(animated: true)

            if response.error == nil, let filePath = response.destinationURL?.path    {

                print(filePath)



                //Open this filepath in Webview Object



                let fileURL = URL(fileURLWithPath: filePath)

                let request = URLRequest(url: fileURL)



            }

        }
        
    }
}


