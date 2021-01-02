//
//  weatherMeApp.swift
//  weatherMe
//
//  Created by Dave Agyakwa on 01/01/2021.
//

import SwiftUI

@main
struct weatherMeApp: App {
   var api=WeatherApi()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
