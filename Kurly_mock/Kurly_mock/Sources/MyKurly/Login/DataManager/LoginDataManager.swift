//
//  LoginDataManager.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/17.
//
import Alamofire

class LoginDataManager {
    func postLogin(_ parameters: LoginRequest, delegate: LoginViewController) {
        AF.request("\(Constant.LOGIN_URL)", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        print(result)
                        delegate.didSuccessSignIn(result)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        // 애초에 이 부분은 클라단에서 vaildation 처리가 되기 때문에 생략해도 될 것 같음
                        // case 2004: delegate.failedToRequest(message: "비밀번호를 입력해주세요")
                        // case 2012: delegate.failedToRequest(message: "아이디를 입력해주세요")
                        case 3003: delegate.failedToRequest(message: "아이디가 잘못 되었습니다.")
                        case 3004: delegate.failedToRequest(message: "비밀번호가 잘못 되었습니다.")
                        case 4000: delegate.failedToRequest(message: "데이터베이스 에러")
                        default: delegate.failedToRequest(message: "피드백을 주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
