//
//  weather.swift
//  weatherMe
//
//  Created by Dave Agyakwa on 02/01/2021.
//

import Foundation

struct Weather:Codable,Identifiable {
    let id: Int
    let main, weatherDescription: String

       enum CodingKeys: String, CodingKey {
           case id, main
           case weatherDescription = "description"
       }

}


struct Main:Codable{
    let temp:Double
}

struct Forcasts:Codable {
    let main: Main
    let weather: [Weather]
    let dtTxt: String

       enum CodingKeys: String, CodingKey {
           case main, weather
           case dtTxt = "dt_txt"
       }
}
