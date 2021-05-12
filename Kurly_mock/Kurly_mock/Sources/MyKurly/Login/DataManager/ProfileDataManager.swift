//
//  ProfileDataManager.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/25.
//
import Alamofire

class ProfileDataManager {
    func getProfile(userID: Int, jwt: String, delegate: MyKurlyViewController) {
        let url = "\(Constant.BASE_URL)/app/users/\(userID)"
        let header: HTTPHeaders = ["x-access-token": jwt]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: ProfileResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        print(result)
                        delegate.setProfile(result: result)
                    }
                    // 실패했을 때
                    else {
                        print("프로필 조회 실패")
//                        switch response.code {
//                        case 3003: delegate.failedToRequest(message: "아이디가 잘못 되었습니다.")
//                        case 3004: delegate.failedToRequest(message: "비밀번호가 잘못 되었습니다.")
//                        case 4000: delegate.failedToRequest(message: "데이터베이스 에러")
//                        default: delegate.failedToRequest(message: "피드백을 주세요")
//                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
//                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
