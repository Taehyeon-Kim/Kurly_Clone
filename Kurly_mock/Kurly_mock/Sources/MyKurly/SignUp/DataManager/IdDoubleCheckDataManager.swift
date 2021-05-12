//
//  IdDoubleCheckDataManager.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/19.
//

import Alamofire

class IdDoubleCheckDataManager {
    func postIdDoubleCheck(_ parameters: IdDoubleCheckRequest, delegate: SignUpViewController) {
        AF.request("\(Constant.DOUBLE_CHECK_URL)", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: IdDoubleCheckResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess {
                        delegate.didSuccessDoubleCheck()
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 3001: delegate.failedToRequest(message: "동일한 아이디가 이미 등록되어 있습니다")
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
