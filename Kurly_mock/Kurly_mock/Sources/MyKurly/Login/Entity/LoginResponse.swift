//
//  LoginResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/17.
//

/*
 1000    성공
 2012    아이디를 입력해주세요.
 2004    비밀번호를 입력해주세요.
 3003    아이디가 잘못 되었습니다.
 3004    비밀번호가 잘못 되었습니다.
 4000    데이터 베이스 에러
 */

/*
 "{
     ""isSuccess"": true,
     ""code"": 1000,
     ""message"": ""성공"",
     ""result"": {
         ""userID"": 2,
         ""jwt"": ""eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjIsImlhdCI6MTYxNTg4NjY1NiwiZXhwIjoxNjQ3NDIyNjU2LCJzdWIiOiJ1c2VySW5mbyJ9.aP5pZn9yK6cRkjel8HoV-CIDDY7o5-MJjGWu-pwZ7I""
     }
 }"
 */

struct LoginResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoginResult?
}

struct LoginResult: Decodable {
    var userID: Int
    var jwt: String
}

