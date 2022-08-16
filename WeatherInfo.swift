//
//  WeatherInfo.swift
//  weatherPJT
//
//  Created by SSG on 2022/07/27.
//

import Foundation
//
///*
// {
//    "city_name":"서울",
//    "state":12,
//    "celsius":17.8,
//    "rainfall_probability":60
// },
//state
//
//10 : sunny
//
//11 : cloudy
//
//12 : rainy
//
//13 : snowy
// */

struct WeatherInfo: Codable {

    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    var celsiusAndFahrenheit: String{
        let fahrenheit = self.celsius*1.8 + 32
        let fahren = String(format: "%.2f", fahrenheit)//소수점 아래 두자리까지만 표시 : String(format) 사용
        return "섭씨 \(self.celsius)도 / 화씨 \(fahren)도"
    }
    
    var fullRainfallPro: String{
        return "강수확률 \(self.rainfallProbability)%"
    }
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state
        case celsius
        case rainfallProbability = "rainfall_probability"
    }

}
