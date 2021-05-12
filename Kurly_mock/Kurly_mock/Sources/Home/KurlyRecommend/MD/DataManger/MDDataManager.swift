//
//  MDDataManager.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/26.
//

import Alamofire

class MDDataManager {
    func getMD(filterType: String, mainCategoryID: String, delegate: MDViewController) {
        let url = "\(Constant.BASE_URL)/app/products?filterType=\(filterType)&mainCategory=\(mainCategoryID)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: ProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.getMD(result: result)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2028: print("해당 필터 타입이 존재하지 않습니다.")
                        case 2029: print("해당 메인카테고리가 존재하지 않습니다.")
                        case 2030: print("상품 목록 조회 필터를 입력해주세요.")
                        case 4000: print("데이터 베이스 에러")
                        default:
                            print("에러 발생")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
