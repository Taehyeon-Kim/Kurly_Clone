//
//  ProductDetails.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/23.
//

/*
 {
     "isSuccess": true,
     "code": 1000,
     "message": "성공",
     "result": {
         "images": "https://img-cf.kurly.com/shop/data/goods/1599543433998y0.jpg,https://img-cf.kurly.com/shop/data/goodsview/20200908/gv00000119410_2.jpg,https://img-cf.kurly.com/shop/data/goodsview/20210309/gv00000163852_2.jpg",
         "productName": "[심플잇] 오트면 충분해 2종",
         "shortInfo": "물만 부어 고소하게 즐기는 7가지 곡물 한끼",
         "discountRate": null,
         "discountPrice": null,
         "price": "1500원",
         "membershipLevel": "일반 0.5%",
         "point": "개당 8원 적립",
         "salesUnit": null,
         "servingSize": "50g",
         "deliveryType": "샛별배송/택배배송",
         "packageType": "C",
         "packageExtraInfo": "택배 배송은 에코포장이 스티로폼으로 대체됩니다.",
         "allergyInfo": "- 우유, 대두, 밀 함유\n- 본 제품은 메밀, 땅콩, 새우, 호두, 오징어, 토마토를 사용한 제품과 같은 제조시설에서 제조",
         "information": null,
         "expirationDate": "출고일 기준, 유통기한 만기 270일 이상 남은 상품을 보내드립니다. (총유통기한 360일)",
         "introContents": "바쁘게 돌아가는 일상 속에서 아침 식사를 챙기는 건 생각보다 쉽지 않죠. 하루의 시작을 여는 만큼 중요하지만 도저히 차려 먹을 여유가 없다면, 심플잇의 '오트면 충분해'를 챙겨 드셔 보세요. 물 또는 우유만 부으면 빠르고 든든하게 영양을 마실 수 있으니까, 간단한 한 끼로 손색없어요. 건강에 도움을 줄 수 있는 7가지 곡물 분말과, 360°C에서 열풍 로스팅해 고소한 맛과 향을 살린 귀리, 현미, 서리태, 아몬드가 바삭하게 씹히는 식감이 먹는 재미까지 더해줘요. 나를 위한 간편하고 심플한 한 끼, '오트면 충분해' 한 병이면 충분할 거예요.",
         "option1": "01. 오트면 충분해 오트&그레인\n\n중량 : 1병(50g)\n주요 원재료 : 7곡 분말(국내산:현미,멥쌀,찰현미,밀,보리,백태,서리태),가공전지분, 가공유지, 정백당, 볶음귀리분말(캐나다산), 서리태가루, 볶은현미분태, 분리대두단백, 볶음아몬드분말\n테이스팅 노트 : 7가지 곡물 분말의 고소하면서 부드러운 맛에, 귀리와 아몬드가 바삭하게 씹히는 식감이 먹는 즐거움을 더해줍니다. ",
         "option2": "\n02. 오트면 충분해 오트&레드빈\n\n중량 : 1병(50g)\n주요 원재료 : 7곡 분말(국내산:현미,멥쌀,찰현미,밀,보리,백태,서리태),가공전지분, 가공유지, 정백당, 볶음귀리분말(캐나다산), 서리태가루, 볶은현미분태, 분리대두단백, 효소처리스테비아, 정제소금\n테이스팅 노트 : 고소한 7가지 곡물 분말에 팥의 구수하고 은은한 단맛이 더해졌어요. 귀리와 아몬드가 바삭하게 씹히는 식감이 먹는 즐거움을 더해줍니다.",
         "kurlyTipContents": "섭취법\n1. 용기를 흔들어 내용물을 섞어주세요.\n2. 물 또는 우유 200mL를 넣고 병을 뒤집어 톡톡 쳐주세요.\n3. 내용물이 아래로 떨어지면 잘 흔들어 주세요.\n\n보관법\n직사광선을 피해 건조하고 서늘한 곳에 보관해 주세요.\n\n주의사항\n뜨거운 물을 담거나 전자레인지에 데우지 마세요.",
         "aboutBrandContents": null,
         "checklist": null,
         "mdComment": null,
         "gmoExplanation": null
     }
 }
 */

struct ProductDetails: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: ProductDetailsResult?
}

struct ProductDetailsResult: Decodable {
    var images: String?
    var productName: String?
    var shortInfo: String?
    var discountRate: String?
    var discountPrice: String?
    var price: String?
    var membershipLevel: String?
    var point: String?
    
    var salesUnit: String?
    var servingSize: String?
    var deliveryType: String?
    var packageType: String?
    var packageExtraInfo: String?
    var allergyInfo: String?
    var information: String?
    var expirationDate: String?
    
    var infoContents: String?
    var option1: String?
    var option2: String?
    var kurlyTipContents: String?
    var aboutBrandContents: String?
    var checklist: String?
    var mdComment: String?
    var gmoExplanation: String?
}
