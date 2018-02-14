//
//  ViewController.swift
//  MyWebBroswer
//
//  Created by Xue Kaiyun on 2018/2/6.
//  Copyright © 2018年 Xue Kaiyun. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate{

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let urlString: String = "http://www.apple.com"
        let url: URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        urlTextField.text = urlString
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        urlTextField.text = webView.url?.absoluteString
    }
    @IBAction func ForwardButtonTrapped(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func BackButtonTrapped(_ sender: Any) {
        webView.goBack()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString: String = urlTextField.text!
        let url: URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        urlTextField.text = urlString
        return true
    }
}

