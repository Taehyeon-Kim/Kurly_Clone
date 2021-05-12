//
//  KakaoZipCodeViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/25.
//

import UIKit
import WebKit

class KakaoZipCodeViewController: UINavigationController {
    
    // MARK: - Variables
    var webView: WKWebView?
    let indicator = UIActivityIndicatorView(style: .medium)
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

extension KakaoZipCodeViewController {
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
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

extension KakaoZipCodeViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // 주소 데이터
        if let data = message.body as? [String: Any] {
            address = data["roadAddress"] as? String ?? ""
            print(data)
        }
        
        print(address)
        
        
        // 다음 뷰컨
        guard let nextVC = UIStoryboard(name: "LocationStoryboard", bundle: nil).instantiateViewController(identifier: "LocationViewController") as? LocationViewController else { return }
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationBar.tintColor = .black
        
        nextVC.address = address
        self.navigationController?.pushViewController(nextVC, animated: true)
//        nextVC.label.text = address

    }
}

extension KakaoZipCodeViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
}
