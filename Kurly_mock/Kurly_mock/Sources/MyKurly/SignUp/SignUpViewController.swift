//
//  SignUpViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/15.
//

import UIKit
import DLRadioButton

class SignUpViewController: UIViewController {
    lazy var dataManager: IdDoubleCheckDataManager = IdDoubleCheckDataManager()
    lazy var signUpManger: SignUpDataManager = SignUpDataManager()
    
    // MARK: - Variables
    var allAgreeFlag: Bool = false
    var allAdFlag: Bool = false
    var keyboardShown:Bool = false // 키보드 상태 확인
    var originY:CGFloat? // 오브젝트의 기본 위치
    
    var activeTextField = UITextField()
    
    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    
    // 영역 1
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var birthYearTextField: UITextField!
    @IBOutlet weak var birthMonthTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    
    // uilabel - 코멘트
    @IBOutlet weak var idCommentStackView: UIStackView!
    @IBOutlet weak var idValidComment: UILabel!
    @IBOutlet weak var doubleCheckComment: UILabel!
    
    @IBOutlet weak var passwordCommentStackView: UIStackView!
    @IBOutlet weak var passwordLenComment: UILabel!
    @IBOutlet weak var passwordCombiComment: UILabel!
    @IBOutlet weak var passwordContiComment: UILabel!
    @IBOutlet weak var passwordDoubleCheckComment: UILabel!
    
    // 추가입력 사항
    @IBOutlet weak var recommenderIDView: UIView!
    @IBOutlet weak var joinEventView: UIView!
    
    @IBOutlet weak var recommederIDTextField: UITextField!
    @IBOutlet weak var joinEventTextField: UITextField!
    
    // button
    @IBOutlet weak var addressButton: UIButton!
    
    @IBOutlet weak var maleButton: DLRadioButton!
    @IBOutlet weak var femaleButton: DLRadioButton!
    @IBOutlet weak var noGenderButton: DLRadioButton!
    @IBOutlet weak var recommederIDButton: DLRadioButton!
    @IBOutlet weak var joinEventButton: DLRadioButton!
    
    @IBOutlet weak var agreeAllButton: DLRadioButton!
    @IBOutlet weak var agreeTermsOfServiceButton: DLRadioButton!
    @IBOutlet weak var agreePrivatePolicyButton: DLRadioButton!
    @IBOutlet weak var agreePrivatePolicyUnNeedButton: DLRadioButton!
    @IBOutlet weak var agreeAdButton: DLRadioButton!
    @IBOutlet weak var agreeSmsButton: DLRadioButton!
    @IBOutlet weak var agreeEmailButton: DLRadioButton!
    @IBOutlet weak var checkAgeButton: DLRadioButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        
        addressButton.addTarget(self, action: #selector(goPopUp), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
        idCheckNotifications()
        passwordCheckNotifications()
        passwordDoubleCheckNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterForKeyboardNotifications()
    }
    
    @IBAction func recommenderIdButtonClicked(_ sender: Any) {
        
        // 참여 이벤트 입력 필드 열려 있으면 닫기
        if !joinEventView.isHidden {
            joinEventView.isHidden = true
        }
    
        // 추천인 입력 필드 열기
        recommenderIDView.isHidden = false
    }
    
    @IBAction func joinEventButtonClicked(_ sender: Any) {
        
        // 추천인 아이디 입력 필드 열려 있으면 닫기
        if !recommenderIDView.isHidden {
            recommenderIDView.isHidden = true
        }
        
        // 참여 이벤트 입력 필드 열기
        joinEventView.isHidden = false
    }
    
    // 중복확인 버튼 클릭 시
    @IBAction func doubleCheckButtonClicked(_ sender: Any) {
        // test code
        // id vaild check
        guard let id = idTextField.text?.trim, id.isExists else {
            presentAlert(title: "아이디(을)를 입력해주세요")
            return
        }
        
        // valid check
        if isValidId(id: id) {
            // Request Double Check
            self.dismissKeyboard()
            let input = IdDoubleCheckRequest(kurlyID: id)
            dataManager.postIdDoubleCheck(input, delegate: self)
            self.doubleCheckComment.text = "✓ 아이디 중복확인"
            self.doubleCheckComment.textColor = .textGreen
        } else {
            // vaild fail
            self.presentAlert(title: "6자 이상의 영문 혹은 영문과 숫자를 조합으로 입력해 주세요")
            self.doubleCheckComment.text = "x 아이디 중복확인"
            self.doubleCheckComment.textColor = .textRed
        }
    }

}

// MARK: - Custom Function - vaild
extension SignUpViewController {
    

    @objc func goPopUp() {
        let popUp = self.storyboard?.instantiateViewController(identifier: "PopUpViewController") as! PopUpViewController
        popUp.modalPresentationStyle = .overCurrentContext
        
        let vc = storyboard?.instantiateViewController(identifier: "DetailAddressViewController") as! DetailAddressViewController
        vc.delegate = self
        
        present(popUp, animated: false, completion: nil)
    }
    
    func didSuccessDoubleCheck() {
        self.presentAlert(title: "사용하실 수 있는 아이디입니다!")
    }
    
    func didSuccessSignUp() {
        self.presentAlert(title: "회원가입을 축하드립니다!\n당신의 일상에 컬리를 더해 보세요.", handler: { action in
            self.navigationController?.popViewController(animated: true)
        })
        
    }
    
    func failedToRequest(message: String) {
        presentAlert(title: message)
    }
    
    // 아이디 유효성 검사
    // ex. 6자 이상의 영문 혹은 영문과 숫자를 조합
    func isValidId(id: String?) -> Bool {
        guard id != nil else { return false }
        
//        let idRegEx = "^[a-zA-Z0-9]{6,}"
        let idRegEx = "^(?!(?:[0-9]+)$)([a-zA-Z]|[0-9a-zA-Z]){6,}$"
        let pred = NSPredicate(format:"SELF MATCHES %@", idRegEx)
        return pred.evaluate(with: id)
    }
    
    // 10자 이상인지
    func isLen10(password: String?) -> Bool {
        guard password != nil else { return false }
        let passwordRegEx = "^(.{10,})$"
        let pred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return pred.evaluate(with: password)
    }
    
    // 조합이 2개 이상인지
    func isComb2(password: String?) -> Bool {
        guard password != nil else { return false }
        let passwordRegEx = "^((?=.*[a-zA-Z])(?=.*[0-9])|(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])|(?=.*[^a-zA-Z0-9])(?=.*[0-9])).+$"
        let pred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return pred.evaluate(with: password)
    }
    
    // 연속된 숫자 3개 이상인지
    func isCont3(password: String?) -> Bool {
        guard password != nil else { return false }
        let passwordRegEx = "^(?!.*([0-9])\\1{2}).+$"
        let pred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return pred.evaluate(with: password)
    }
}

// MARK: - IBAction {
extension SignUpViewController {
    // 전체 동의 버튼 클릭 시
    @IBAction func agreeAllButtonClicked(_ sender: Any) {

        // 전체 동의 버튼 on - 나머지 전부 on
        if self.agreeAllButton.isSelected {
            for radioButton in self.agreeAllButton.otherButtons {
                if !radioButton.isSelected {
                    radioButton.isSelected = true
                }
            }
        }
        // 전체 동의 버튼 off - 나머지 전부 off
        else {
            for radioButton in self.agreeAllButton.otherButtons {
                if radioButton.isSelected {
                    radioButton.isSelected = false
                }
            }
        }
    }
    
    // 이용약관동의버튼(필수) 클릭 시
    @IBAction func agreeTermOfServiceButtonClicked(_ sender: Any) {
        if self.agreeTermsOfServiceButton.isSelected {
            print("여기")
            for radioButton in self.agreeAllButton.otherButtons {
                if !radioButton.isSelected {
                    self.allAgreeFlag = false
                    break
                } else {
                    self.allAgreeFlag = true
                }
            }
        } else {
            self.allAgreeFlag = false
        }

        print("flag - \(allAgreeFlag)")
        self.agreeAllButton.isSelected = allAgreeFlag
    }
    
    // 개인정보동의버튼(필수) 클릭 시
    @IBAction func agreePrivacyPolicyNeedButtonClicked(_ sender: Any) {
        if self.agreePrivatePolicyButton.isSelected {
            for radioButton in self.agreeAllButton.otherButtons {
                if !radioButton.isSelected {
                    self.allAgreeFlag = false
                    break
                } else {
                    self.allAgreeFlag = true
                }
            }
        } else {
            self.allAgreeFlag = false
        }

        self.agreeAllButton.isSelected = allAgreeFlag
    }
    
    // 개인정보동의버튼(선택) 클릭 시
    @IBAction func agreePrivacyPolicyUnneedButtonClicked(_ sender: Any) {
        if self.agreePrivatePolicyUnNeedButton.isSelected {
            for radioButton in self.agreeAllButton.otherButtons {
                if !radioButton.isSelected {
                    self.allAgreeFlag = false
                    break
                } else {
                    self.allAgreeFlag = true
                }
            }
        } else {
            self.allAgreeFlag = false
        }

        self.agreeAllButton.isSelected = allAgreeFlag
    }
    
    // 정보 수신 동의 버튼 클릭 시
    @IBAction func agreeAdButtonClicked(_ sender: Any) {
        // 전체 동의 버튼 on - 나머지 전부 on
        if self.agreeAdButton.isSelected {
            for radioButton in self.agreeAdButton.otherButtons {
                if !radioButton.isSelected {
                    radioButton.isSelected = true
                }
            }
        }
        // 전체 동의 버튼 off - 나머지 전부 off
        else {
            for radioButton in self.agreeAdButton.otherButtons {
                if radioButton.isSelected {
                    radioButton.isSelected = false
                }
            }
        }
    }
    
    @IBAction func agreeSMSButtonClicked(_ sender: Any) {
        if self.agreeSmsButton.isSelected {
            for radioButton in self.agreeAllButton.otherButtons {
                if !radioButton.isSelected {
                    self.allAgreeFlag = false
                    break
                } else {
                    self.allAgreeFlag = true
                }
            }
        } else {
            self.allAgreeFlag = false
        }

        self.agreeAllButton.isSelected = allAgreeFlag
    }
    
    @IBAction func agreeEmailButtonClicked(_ sender: Any) {
        if self.agreeEmailButton.isSelected {
            for radioButton in self.agreeAllButton.otherButtons {
                if !radioButton.isSelected {
                    self.allAgreeFlag = false
                    break
                } else {
                    self.allAgreeFlag = true
                }
            }
        } else {
            self.allAgreeFlag = false
        }

        self.agreeAllButton.isSelected = allAgreeFlag
    }
    
    @IBAction func agreeAgeCheckButtonClicked(_ sender: Any) {
        if self.checkAgeButton.isSelected {
            for radioButton in self.agreeAllButton.otherButtons {
                if !radioButton.isSelected {
                    self.allAgreeFlag = false
                    break
                } else {
                    self.allAgreeFlag = true
                }
            }
        } else {
            self.allAgreeFlag = false
        }

        self.agreeAllButton.isSelected = allAgreeFlag
    }
    
    // 뒤로가기 버튼 클릭 이벤트
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // 가입완료 버튼 클릭 이벤트
    // -- 아이디 : 아이디(을)를 입력해주세요
    // -- 중복확인 : 아이디 중복확인을 확인해주세요
    // ---- 사용 가능 : 사용하실 수 있는 아이디입니다!
    // ---- 사용 불가 :
    // -- 비밀번호 : 비밀번호를 입력해주세요
    // -- 비밀번호 체크 : 비밀번호를 한 번 더 입력해주세요
    // -- 이름 : 이름을(를) 입력해주세요
    // -- 이메일 : 이메일 형식을 확인해주세요
    @IBAction func signUpButtonClicked(_ sender: Any) {
        // code
        print("가입하기 버튼 클릭 됨")
        
        // ID vaildation
        guard let id = idTextField.text?.trim, id.isExists else {
            presentAlert(title: "아이디(을)를 입력해주세요")
            return
        }
        
        // Password validation
        guard let password = passwordTextField.text, password.isExists else {
            presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        // Password Check validation
        guard let passwordCheck = passwordCheckTextField.text, passwordCheck.isExists else {
            presentAlert(title: "비밀번호를 한 번더 입력해주세요")
            return
        }
        
        // Password Check validation
        guard let name = nameTextField.text, name.isExists else {
            presentAlert(title: "이름을 입력해주세요")
            return
        }
        
        // Email validation
        guard let email = emailTextField.text, email.isExists else {
            presentAlert(title: "이메일 형식을 확인해주세요")
            return
        }
        
        // Phone validation
        guard let phoneNumber = phoneNumberTextField.text, phoneNumber.isExists else {
            presentAlert(title: "휴대폰 인증을 완료 해 주세요")
            return
        }
        
        self.dismissKeyboard()
        let input = SignUpRequest(kurlyID: id, password: password, passwordCheck: passwordCheck, name: name, email: email, phone: phoneNumber, address: "서울시 노원구")
        signUpManger.postSignUp(input, delegate: self)
    }
}

// MARK: - Private Function
extension SignUpViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        self.view.endEditing(true)
        
    }

    
    fileprivate func setupDefault() {
        setupButton()
        setupTextField()
    }
    
    private func setupTextField() {
        idTextField.delegate = self
        passwordTextField.delegate = self
        passwordCheckTextField.delegate = self
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        birthYearTextField.delegate = self
        birthMonthTextField.delegate = self
        birthDateTextField.delegate = self
        
        
    }
    
    func setupButton() {
        self.agreeAllButton.isMultipleSelectionEnabled = true
    }
    
    func idCheckNotifications() {
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object: idTextField, queue: .main)
        { (notification) in
            
            guard let id = self.idTextField.text?.trim, id.isExists else {
                return
            }
            
            if self.isValidId(id: id) {
//                print("✅ 아이디 타당")
                self.idValidComment.text = "✓ 6자 이상의 영문 혹은 영문과 숫자를 조합"
                self.idValidComment.textColor = .textGreen
            } else {
//                print("🚨 아이디 불가")
                self.idValidComment.text = "x 6자 이상의 영문 혹은 영문과 숫자를 조합"
                self.idValidComment.textColor = .textRed
            }
        }
    }
    
    func passwordCheckNotifications() {
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object: passwordTextField, queue: .main)
        { (notification) in
            
            guard let password = self.passwordTextField.text?.trim else {
                return
            }
            
            if self.isLen10(password: password){
//                print("✅ 10자 이상 입력")
                self.passwordLenComment.text = "✓ 10자 이상 입력"
                self.passwordLenComment.textColor = .textGreen
            } else {
                self.passwordLenComment.text = "x 10자 이상 입력"
                self.passwordLenComment.textColor = .textRed
            }
            
            if self.isComb2(password: password){
                print("✅ 조합 2개 이상")
                self.passwordCombiComment.text = "✓ 영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합"
                self.passwordCombiComment.textColor = .textGreen
            } else {
                print("🚨 조합 2개 미만")
                self.passwordCombiComment.text = "x 영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합"
                self.passwordCombiComment.textColor = .textRed
            }
            
            if self.isCont3(password: password){
//                print("✅ 동일한 숫자 3개 미만")
                self.passwordContiComment.text = "✓ 동일한 숫자 3개 이상 연속 사용 불가"
                self.passwordContiComment.textColor = .textGreen
            } else {
//                print("🚨 동일한 숫자 3개 이상")
                self.passwordContiComment.text = "x 동일한 숫자 3개 이상 연속 사용 불가"
                self.passwordContiComment.textColor = .textRed
            }

        }
    }
    
    func passwordDoubleCheckNotifications() {
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object: passwordCheckTextField, queue: .main)
        { (notification) in
            
            guard let passwordCheck = self.passwordCheckTextField.text?.trim, passwordCheck.isExists else {
                return
            }
            
            if passwordCheck == self.passwordTextField.text {
                self.passwordDoubleCheckComment.text = "✓ 동일한 비밀번호를 입력해주세요"
                self.passwordDoubleCheckComment.textColor = .textGreen
            } else {
                self.passwordDoubleCheckComment.text = "x 동일한 비밀번호를 입력해주세요"
                self.passwordDoubleCheckComment.textColor = .textRed
            }
        }
    }
    
    func registerForKeyboardNotifications() {
        // 옵저버 등록
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        // 옵저버 등록 해제
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        // 키보드 사이즈 체크
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            let inset  = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 20, right: 0)
            scrollView.contentInset = inset
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }

}

// MARK: - 텍스트 필드 델리게이트 (text field delegate)

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
        
        switch textField {
        case idTextField:
            self.idCommentStackView.isHidden = false
        case passwordTextField:
            self.passwordCommentStackView.isHidden = false
        case passwordCheckTextField:
            self.passwordDoubleCheckComment.isHidden = false
        default:
            return
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var maxLength : Int = 0
        
        switch textField {
        case idTextField:
            maxLength = 16
        case passwordTextField:
            maxLength = 16
        case passwordCheckTextField:
            maxLength = 16
        case nameTextField:
            maxLength = 10
        case phoneNumberTextField:
            maxLength = 11
        case birthYearTextField:
            maxLength = 4
        case birthMonthTextField:
            maxLength = 2
        case birthDateTextField:
            maxLength = 2
        default: // 이메일
            maxLength = 100
        }

        let currentString: NSString = textField.text! as NSString
        
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}


extension SignUpViewController: DetailAddressDelegate {
    func inputAddress(address: String, detailAddress: String) {
        print(address, detailAddress)
    }
}
