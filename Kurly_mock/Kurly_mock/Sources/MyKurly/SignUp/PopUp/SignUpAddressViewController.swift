//
//  SignUpAddressViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/25.
//

import UIKit
import WebKit

class SignUpAddressViewController: BaseViewController {
    
    // MARK: - Variables
    var webView: WKWebView?
    let indicator = UIActivityIndicatorView(style: .medium)
    var zipCode = ""
    var address = ""
    

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        self.title = "주소검색"
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SignUpAddressViewController {
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        setAttributes()
        setContraints()
    }

    private func setAttributes() {
        let contentController = WKUserContentController()
        contentController.add(self, name: "callBackHandler")

        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController

        webView = WKWebView(frame: .zero, configuration: configuration)
        self.webView?.navigationDelegate = self

        guard let url = URL(string: "https://taehyeon-kim.github.io/Kakao-PostCode/"),
            let webView = webView
            else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        indicator.startAnimating()
    }

    private func setContraints() {
        guard let webView = webView else { return }
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false

        webView.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            indicator.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: webView.centerYAnchor),
        ])
    }

}

extension SignUpAddressViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // 주소 데이터
        if let data = message.body as? [String: Any] {
            address = data["roadAddress"] as? String ?? ""
            zipCode = data["zonecode"] as? String ?? ""
             
            print(data)
        }

        // 다음 뷰컨
        let nextVC = storyboard?.instantiateViewController(identifier: "DetailAddressViewController") as! DetailAddressViewController
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.addr = address
        nextVC.zipcode = zipCode
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}

extension SignUpAddressViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
}
