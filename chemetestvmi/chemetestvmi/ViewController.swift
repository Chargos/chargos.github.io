//
//  ViewController.swift
//  chemetestvmi
//
//  Created by Petrovichev Maksim on 26.10.2022.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let htmlString = """
//<!DOCTYPE html>
//<html>
//   <head>
//      <title>HTML Hyperlinks</title>
//   </head>
//
//   <body>
//      <h1>Company</h1>
//      <p>
//         We are a <a href="https://www.google.com/">team</a> of professionals working
//         hard to provide free learning content.
//      </p>
//   </body>
//</html>
//
//"""
//
//        webview.loadHTMLString(htmlString, baseURL: nil)
        

    }


    @IBAction func openUrlScheme(_ sender: Any) {
        if let url = URL(string: "vmiii://"),
            UIApplication.shared.canOpenURL(url) {

            UIApplication.shared.open(url)
        }
        else {
            UIApplication.shared.open(URL(string: "https://apps.apple.com/us/app/uber/id368677368")!)
        }
    }
    
    @IBAction func openSafariVC(_ sender: Any) {
        if let url = URL(string: "https://jsfiddle.net/1ocyq2j0/show") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
    
    
    
    
    
}

