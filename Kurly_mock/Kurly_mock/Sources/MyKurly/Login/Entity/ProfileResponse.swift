//
//  ProfileResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/25.
//

/*
 "{
     ""isSuccess"": true,
     ""code"": 1000,
     ""message"": ""성공"",
     ""result"": {
         ""name"": ""테스트님"",
         ""membershipLevelName"": ""일반"",
         ""pointRate"": ""적립 0.5%""
     }
 }"
 */

struct ProfileResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: Profile?
}

struct Profile: Decodable {
    var name: String?
    var membershipLevelName: String?
    var pointRate: String?
}
