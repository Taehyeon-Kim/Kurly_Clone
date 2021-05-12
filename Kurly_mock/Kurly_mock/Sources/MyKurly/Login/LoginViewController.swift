//
//  LoginViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/15.
//

import UIKit

protocol LoginDelegate{
    func modalDidFinished(loginState: Bool, userID: Int, jwt: String)
}

// BaseViewController로 선언해주지 않은 이유는 네비게이션 공통 적용 부분을 제거해주기 위해서이다.
class LoginViewController: UIViewController {
    // MARK: - Variables
    lazy var dataManager: LoginDataManager = LoginDataManager()
    var delegate: LoginDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var findIdButton: UIButton!
    @IBOutlet weak var findPasswordButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextField()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        // ID vaildation
        guard let id = idTextField.text?.trim, id.isExists else {
            showToast(message: "아이디를 입력해주세요")
            return
        }
        
        // Password validation
        guard let password = passwordTextField.text, password.isExists else {
            showToast(message: "비밀번호를 입력해주세요")
            return
        }
        
        // Requst Sign In
        self.dismissKeyboard()
        let input = LoginRequest(kurlyID: id, password: password)
        dataManager.postLogin(input, delegate: self)
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        let signUpViewController = UIStoryboard(name: "SignUpStoryboard", bundle: nil).instantiateViewController(identifier: "SignUpViewController")
        // 회원가입 페이지 back button 타이틀 및 색상 수정 - 이전 뷰에서 선언해줘야 해당 뷰에 영향을 미치지 않음
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}

// MARK: - 네트워크 통신 관련 처리
extension LoginViewController {
    
    func showToast(message : String) {
        let width_variable:CGFloat = 20
        
        // 뷰가 위치 지정해주기. 위에서부터 50만큼 떨어져있고, 양쪽에 20만큼 여백을 가지고, 높이는 50
        
        let toastLabel = UILabel(frame: CGRect(x: width_variable, y: 100, width: self.view.frame.size.width-2 * width_variable, height: 50))
        toastLabel.backgroundColor = UIColor.toastBg
        toastLabel.textColor = UIColor.toastLabel
        toastLabel.textAlignment = .left;
        toastLabel.font = UIFont.NotoSans(.medium, size: 16)
        toastLabel.text = message
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        self.view.addSubview(toastLabel)

        UIView.animate(withDuration: 0.2, delay: 1.5, animations: {
            toastLabel.frame.origin.y = -100
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })

     }
    
    func didSuccessSignIn(_ result: LoginResult) {
//        self.presentAlert(title: "로그인에 성공하였습니다", message: result.jwt)
        let prevVC = UIStoryboard(name: "MyKurlyStoryboard", bundle: nil).instantiateViewController(identifier: "MyKurlyViewController") as! MyKurlyViewController
        UserDefaults.standard.setValue(result.jwt, forKey: "jwt")
        self.delegate?.modalDidFinished(loginState: true, userID: result.userID, jwt: result.jwt)
        prevVC.loginState = true
        self.dismiss(animated: true, completion: nil)
    }
    
    func failedToRequest(message: String) {
        showToast(message: message)
    }
}

extension LoginViewController {
    fileprivate func setupUI() {
        self.title = "로그인"
        self.navigationController?.navigationBar.barTintColor = .white
        
        // border
        self.idView.layer.borderColor = UIColor.lightGray.cgColor
        self.idView.layer.borderWidth = 1
        self.idView.layer.cornerRadius = 4
        
        self.passwordView.layer.borderColor = UIColor.lightGray.cgColor
        self.passwordView.layer.borderWidth = 1
        self.passwordView.layer.cornerRadius = 4
        
        self.loginButton.layer.cornerRadius = 4
        
        self.signupButton.layer.borderWidth = 1
        self.signupButton.layer.borderColor = UIColor.mainPurple.cgColor
        self.signupButton.layer.cornerRadius = 4
        
        // font
        self.idTextField.font = UIFont.NotoSans(.regular, size: 16)
        self.passwordTextField.font = UIFont.NotoSans(.regular, size: 16)
        self.loginButton.titleLabel?.font = UIFont.NotoSans(.medium, size: 16)
        self.signupButton.titleLabel?.font = UIFont.NotoSans(.medium, size: 16)
        
        self.findIdButton.titleLabel?.font = UIFont.NotoSans(.regular, size: 12)
        self.findPasswordButton.titleLabel?.font = UIFont.NotoSans(.regular, size: 12)
        
        // placeholder
        self.idTextField.placeholder = "아이디를 입력해주세요"
        self.passwordTextField.placeholder = "비밀번호를 입력해주세요"
    }
    
    fileprivate func setupTextField() {
        self.idTextField.delegate = self
        self.passwordTextField.delegate = self
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Text Field Focus 되었을 때 border 색상
        if textField == self.idTextField {
            self.idView.layer.borderColor = UIColor.black.cgColor
            self.passwordView.layer.borderColor = UIColor.lightGray.cgColor
        } else if textField == self.passwordTextField {
            self.passwordView.layer.borderColor = UIColor.black.cgColor
            self.idView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}
