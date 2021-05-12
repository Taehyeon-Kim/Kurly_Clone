//
//  RecipeResponse.swift
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
             ""image"": ""레시피3 이미지 url"",
             ""recipeTitle"": ""시금치 페스토 파스타""
         },
         {
             ""image"": ""레시피7 이미지 url"",
             ""recipeTitle"": ""도다리 냉이국""
         },
         {
             ""image"": ""레시피4 이미지 url"",
             ""recipeTitle"": ""황태양념구이""
         },
         {
             ""image"": ""레시피1 이미지 url"",
             ""recipeTitle"": ""메밀 갈레트""
         },
         {
             ""image"": ""레시피6 이미지 url"",
             ""recipeTitle"": ""티라미수""
         }
     ]
 }"
 */
struct RecipeResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [RecipeResult]?
}

struct RecipeResult: Decodable {
    var image: String?
    var recipeTitle: String?
}
