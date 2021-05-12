//
//  ProductsResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

/*
 "isSuccess": true,
     "code": 1000,
     "message": "성공",
     "result": [
         {
             "productID": 24,
             "image": "상품18 이미지 url",
             "productName": "[석관동 떡볶이] 기름 떡볶이",
             "discountRate": "5%",
             "discountPrice": "4275원",
             "price": "4500원",
             "tag": "한정수량"
         },
         {
             "productID": 15,
             "image": "상품9 이미지 url",
             "productName": "[더오담] 한입 현미 강정",
             "discountRate": "10%",
             "discountPrice": "2070원",
             "price": "2300원",
             "tag": "Kurly Only"
         },
         {
             "productID": 10,
             "image": "상품4 이미지 url",
             "productName": "[미주라] 통밀 도너츠",
             "discountRate": "10%",
             "discountPrice": "3780원",
             "price": "4200원",
             "tag": "Kurly Only,Kurly Only"
         },
         {
             "productID": 18,
             "image": "상품12 이미지 url",
             "productName": "[떡편] 리얼 고구마떡",
             "discountRate": "15%",
             "discountPrice": "6120원",
             "price": "7200원",
             "tag": "Kurly Only"
         }
     ]
 */

struct ProductsResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ProductsResult]?
}

struct ProductsResult: Decodable {
    var productID: Int?
    var image: String?
    var productName: String?
    var discountRate: String?
    var discountPrice: String?
    var price: String?
    var tag: String?
}
