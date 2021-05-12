//
//  ProductsDatamanager.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//
import Alamofire

class ProductsDatamanager {
    func getProducts(filterType: String, mainCategoryID: String, delegate: ProductHowViewController) {
        let url = "\(Constant.BASE_URL)/app/products?filterType=\(filterType)&mainCategory=\(mainCategoryID)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: ProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.getProducts(result: result)
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
    
    // MARK: - 알뜰세일
    func getFrugalProducts(filterType: String, mainCategoryID: String, delegate: ProductFrugalViewController) {
        let url = "\(Constant.BASE_URL)/app/products?filterType=\(filterType)&mainCategory=\(mainCategoryID)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: ProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.getFrugalProducts(result: result)
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
    
    // MARK: - 오늘의 신상품
    func getNewProducts(filterType: String, mainCategoryID: String, delegate: ProductNewViewController) {
        let url = "\(Constant.BASE_URL)/app/products?filterType=\(filterType)&mainCategory=\(mainCategoryID)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: ProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.getNewProducts(result: result)
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
    
    // MARK: - 지금 가장 핫한 상품
    func getHotProducts(filterType: String, mainCategoryID: String, delegate: ProductHotViewController) {
        let url = "\(Constant.BASE_URL)/app/products?filterType=\(filterType)&mainCategory=\(mainCategoryID)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: ProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.getHotProducts(result: result)
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
    
    // MARK: - 마감 세일
    func getSaleProducts(filterType: String, mainCategoryID: String, delegate: ProductSaleViewController) {
        let url = "\(Constant.BASE_URL)/app/products?filterType=\(filterType)&mainCategory=\(mainCategoryID)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: ProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.getSaleProducts(result: result)
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
    
    // MARK: - 기분 좋은 가격
    func getGoodPrice(filterType: String, mainCategoryID: String, delegate: GoodPriceViewController) {
        let url = "\(Constant.BASE_URL)/app/products?filterType=\(filterType)&mainCategory=\(mainCategoryID)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: ProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.getGoodPrice(result: result)
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
    
    // MARK: - 오프라인 맛집 데이터매니저
    func getOfflineProducts(filterType: String, mainCategoryID: String, delegate: OfflineViewController) {
        let url = "\(Constant.BASE_URL)/app/products?filterType=\(filterType)&mainCategory=\(mainCategoryID)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: ProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.getOfflineProducts(result: result)
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
