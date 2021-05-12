//
//  SignUpDataManager.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/20.
//

import Alamofire

class SignUpDataManager {
    func postSignUp(_ parameters: SignUpRequest, delegate: SignUpViewController) {
        AF.request("\(Constant.SIGNUP_URL)", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: SignUpResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess {
                        delegate.didSuccessSignUp()
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 3001: delegate.failedToRequest(message: "중복된 아이디입니다.")
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

