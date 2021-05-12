//
//  SignUpRequest.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/20.
//

/*
 kurlyID    String    Y    "eunji66"
 password    String    Y    "password0987"
 passwordCheck    String    Y    "password0987"
 name    String    Y    "김은지"
 email    String    Y    "eunji66@naver.com"
 phone    String    Y    "01009876543"
 address    String    Y
 */

struct SignUpRequest: Encodable {
    var kurlyID: String
    var password: String
    var passwordCheck: String
    var name: String
    var email: String
    var phone: String
    var address: String
}
