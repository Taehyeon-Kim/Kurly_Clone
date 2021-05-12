//
//  IdDoubleCheckResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/19.
//

struct IdDoubleCheckResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
}
