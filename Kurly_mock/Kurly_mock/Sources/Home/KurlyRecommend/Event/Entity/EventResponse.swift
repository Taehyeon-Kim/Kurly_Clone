//
//  EventResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

/*
 "{
     ""isSuccess"": true,
     ""code"": 1000,
     ""message"": ""성공"",
     ""result"": [
         {
             ""image"": ""이벤트5 이미지 url"",
             ""eventTitle"": ""제이키친 최대 7% 할인"",
             ""eventSubTitle"": ""자작한 국물과 쫀득한 떡""
         },
         {
             ""image"": ""이벤트3 이미지 url"",
             ""eventTitle"": ""이주의 과일, 채소 최대 25% 할인"",
             ""eventSubTitle"": ""토마토부터 고구마까지""
         },
         {
             ""image"": ""이벤트7 이미지 url"",
             ""eventTitle"": ""위드진해 최대 20% 할인"",
             ""eventSubTitle"": ""안주로 제격! 곱창 전골, 구이""
         }
     ]
 }"
 */

struct EventResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [Event]?
}

struct Event: Decodable {
    var image: String?
    var eventTitle: String?
    var eventSubTitle: String?
}
