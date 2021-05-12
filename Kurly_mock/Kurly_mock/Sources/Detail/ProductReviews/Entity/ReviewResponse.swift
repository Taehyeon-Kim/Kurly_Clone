//
//  ReviewResponse.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/23.
//

/*
 {
     "isSuccess": true,
     "code": 1000,
     "message": "성공",
     "result": [
         {
             "reviewID": 1,
             "reviewTitle": "[공지] 금주의 Best 후기 안내",
             "writer": "마켓컬리 관리자",
             "date": "2021.03.22"
         },
         {
             "reviewID": 2,
             "reviewTitle": "[공지] 상품 후기 적립금 정책 안내",
             "writer": "마켓컬리 관리자",
             "date": "2021.03.22"
         },
         {
             "reviewID": 6,
             "reviewTitle": "가성비 좋아요",
             "writer": "김*현",
             "date": "2021.03.22"
         },
         {
             "reviewID": 7,
             "reviewTitle": "재구매 의사 있어요~",
             "writer": "김*지",
             "date": "2021.03.22"
         },
         {
             "reviewID": 8,
             "reviewTitle": "만족스럽습니다",
             "writer": "이*호",
             "date": "2021.03.22"
         }
     ]
 }
 */

/*
 {
     "isSuccess": true,
     "code": 1000,
     "message": "성공",
     "result": [
         {
             "reviewCountByProductID": [
                 {
                     "countOfReview": 5
                 }
             ],
             "reviewList": [
                 {
                     "reviewID": 1,
                     "reviewTitle": "[공지] 금주의 Best 후기 안내",
                     "writer": "마켓컬리 관리자",
                     "date": "2021.03.21"
                 },
                 {
                     "reviewID": 2,
                     "reviewTitle": "[공지] 상품 후기 적립금 정책 안내",
                     "writer": "마켓컬리 관리자",
                     "date": "2021.03.21"
                 },
                 {
                     "reviewID": 6,
                     "reviewTitle": "가성비 좋아요",
                     "writer": "테*트",
                     "date": "2021.03.22"
                 },
                 {
                     "reviewID": 7,
                     "reviewTitle": "재구매 의사 있어요~",
                     "writer": "이*지",
                     "date": "2021.03.22"
                 },
                 {
                     "reviewID": 8,
                     "reviewTitle": "만족스럽습니다",
                     "writer": "최*민",
                     "date": "2021.03.22"
                 }
             ]
         }
     ]
 }
 */

struct ReviewResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ReviewResult]?
}

struct ReviewResult: Decodable {
    var reviewCountByProductID: [CountOfReview]
    var reviewList: [Review]
}

struct CountOfReview: Decodable {
    var countOfReview: Int
}

struct Review: Decodable {
    var reviewID: Int
    var reviewTitle: String
    var writer: String
    var date: String
}

