//
//  SignUpResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/20.
//

struct SignUpResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
}
