//
//  WebViewVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    
    @IBOutlet weak var urlInputTextField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlInputTextField?.text = "https://nasa.gov/"
        loadRequest()
    }
    
    func loadRequest() {
        if let address = urlInputTextField?.text,
           let url = URL(string: address) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Actions
    
    
    
}
