//
//  Country.swift
//  weatherPJT
//
//  Created by SSG on 2022/07/27.
//

import Foundation

/*
 {"korean_name":"한국","asset_name":"kr"}
 */

//countries json파일을 읽어오기 위한 타입 선언
struct Country: Codable {
    
    let koreanName: String
    let assetName: String
    
    //CodingKey : json의 데이터 변수명을 소문자 카멜 케이스인 swift타입으로 변경하기 위해 사용하는 프로토콜
    enum CodingKeys: String, CodingKey{
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
