//
//  weathers.swift
//  weatherMe
//
//  Created by Dave Agyakwa on 02/01/2021.
//

import Foundation
struct Weathers:Decodable {
    let cnt: Int
    let list:[Forcasts]
    let city:City
}
