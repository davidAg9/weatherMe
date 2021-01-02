//
//  Weatherapi.swift
//  weatherMe
//
//  Created by Dave Agyakwa on 01/01/2021.
//

import Foundation


class WeatherApi:ObservableObject{

    public var weathers:Weathers?
    private let queryString:String

    init() {

        queryString="Accra"
        var mydata:Weathers?
        let headers = [
            "x-rapidapi-key": "444b8bade5msh19f0203fc1bb300p18dbd3jsn173095bb0257",
            "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
            "content-type": "application/json; charset=utf-8"

        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://community-open-weather-map.p.rapidapi.com/forecast?q=\(queryString)&units=metric&cnt=50")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
       session.dataTask(with: request as URLRequest, completionHandler: { (data, _, error) -> Void in
            if (error != nil) {
                print(error as Any)

            }else {

                mydata=try!JSONDecoder().decode(Weathers.self, from: data!)


                DispatchQueue.main.async {
                    self.weathers = mydata

                }
            }
       }).resume().self


    }



//    func apicall() -> Data {
//
//        var mydata=Data()
//        let headers = [
//            "x-rapidapi-key": "444b8bade5msh19f0203fc1bb300p18dbd3jsn173095bb0257",
//            "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://community-open-weather-map.p.rapidapi.com/forecast?q=\(queryString)&units=metric&cnt=50")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error as Any)
//            } else {
//               mydata=data!
//            }
//        })
//        dataTask.resume()
//
//        return mydata
//    }
}
