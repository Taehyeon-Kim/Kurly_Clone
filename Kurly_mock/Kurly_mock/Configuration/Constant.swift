//
//  Constant.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/13.
//

import Foundation

struct Constant {
    // Base URL
    static let BASE_URL = "https://dev.hailey-softsquared.shop"
    
    // 로그인
    // - post 요청
    // - [v] postman 요청 확인
    static let LOGIN_URL = BASE_URL + "/app/login"
    
    // 회원가입
    // - post 요청
    // - 클라쪽에서 vaildation한 값을 요청해야 함
    static let SIGNUP_URL = BASE_URL + "/app/users"
    
    static let DOUBLE_CHECK_URL = BASE_URL + "/app/check-id"
}
