//
//  QuestionResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/23.
//

struct QuestionResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [Question]?
}

struct Question: Decodable {
    var questionID: Int
    var questionTitle: String
    var writer: String
    var date: String
}
