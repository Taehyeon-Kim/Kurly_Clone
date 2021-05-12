//
//  ProductImageResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/23.
//
/*
 "{
     ""isSuccess"": true,
     ""code"": 1000,
     ""message"": ""성공"",
     ""result"": {
         ""image"": ""상품7 상품이미지 url""
     }
 }"    
 */

struct ProductImageResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: ProductImage?
}

struct ProductImage: Decodable {
    var image: String?
}
