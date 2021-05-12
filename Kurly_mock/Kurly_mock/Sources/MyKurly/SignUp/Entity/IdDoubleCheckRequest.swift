//
//  IdDoubleCheckRequest.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/19.
//

/*
 isSuccess    boolean   Y    TRUE
 code         int       Y    1000
 message      String    Y    성공
 */

/*
 "{
     ""isSuccess"": true,
     ""code"": 1000,
     ""message"": ""성공""
 }"
 */


struct IdDoubleCheckRequest: Encodable {
    var kurlyID: String
}
