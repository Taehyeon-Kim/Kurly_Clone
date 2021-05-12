//
//  OptionResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/26.
//

/*
 {
     "isSuccess": true,
     "code": 1000,
     "message": "성공",
     "result": [
         {
             "optionID": 1,
             "optionName": "(품절)[심플잇] 오트면 충분해 그레인 50g",
             "discountPrice": null,
             "price": "1500원"
         },
         {
             "optionID": 2,
             "optionName": "[심플잇] 오트면 충분해 레드빈 50g",
             "discountPrice": null,
             "price": "1500원"
         }
     ]
 }
 */

struct OptionResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [Option]?
}

struct Option: Decodable {
    var optionID: Int?
    var optionName: String?
    var discountPrice: String?
    var price: String?
}
