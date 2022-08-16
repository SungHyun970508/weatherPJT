//
//  StateInfor.swift
//  weatherPJT
//
//  Created by SSG on 2022/08/11.
// 이미지 텍스트도 변수로 관리하여 반복되는 코드를 줄일 수 있음...? enum타입을 관리하여 흠 흠 흠..
//case 10:
//    stateLabel.text = "맑음"
//    imageURL = "sunny"
//case 11:
//    stateLabel.text = "구름"
//    imageURL = "cloudy"
//case 12:
//    stateLabel.text = "비"
//    imageURL = "rainy"
//case 13:
//    stateLabel.text = "눈"
//    imageURL = "snowy"
import Foundation

struct StateInformation{
    var imageURL: String?
    var stateText: String?
    
    enum StateInforms: Int {
        case ten = 10
        case eleven = 11
        case twelve = 12
        case thirty = 13
        
        var imageURL: String {
            get{
                switch self{
                case .ten:
                    return "sunny"
                case .eleven:
                    return "cloudy"
                case .twelve:
                    return "rainy"
                case .thirty:
                    return "snowy"
                }
            }
        }
        
        var stateText: String {
            get{
                switch self{
                case .ten:
                    return "맑음"
                case .eleven:
                    return "구름"
                case .twelve:
                    return "비"
                case .thirty:
                    return "눈"
                }
            }
        }
    }

    
   
   
}


