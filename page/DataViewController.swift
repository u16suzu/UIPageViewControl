//
//  DataViewController.swift
//  page
//
//  Created by u16suzu on 2015/11/25.
//  Copyright © 2015年 IGNIS LTD. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webView2: UIWebView!
    
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string: "https://google.com")
        let req = NSURLRequest(URL: requestURL!)
        webView.loadRequest(req)
        
        let requestURL2 = NSURL(string: "https://yahoo.com")
        let req2 = NSURLRequest(URL: requestURL2!)
        webView2.loadRequest(req2)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
        
        if(index==0){
            webView.hidden=false
            webView2.hidden=true
        }else{
            webView.hidden=true
            webView2.hidden=false
        }
    }

}

