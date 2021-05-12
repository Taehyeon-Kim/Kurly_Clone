//
//  LoginRequest.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/17.
//

/*
 kurlyID    String     Y    "hyemin11"        컬리 아이디
 password   String     Y    "password1111"    비밀번호
 */

struct LoginRequest: Encodable {
    var kurlyID: String
    var password: String
}
