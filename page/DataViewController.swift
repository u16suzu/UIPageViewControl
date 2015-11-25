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

    
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var requestURL = NSURL(string: "https://google.com")
        let req = NSURLRequest(URL: requestURL!)
        webView.loadRequest(req)
        
//        var requestURL2 = NSURL(string: "https://yahoo.com")
//        let req2 = NSURLRequest(URL: requestURL2!)
//        webView2.loadRequest(req2)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }

}

