//
//  ContentView.swift
//  weatherMe
//
//  Created by Dave Agyakwa on 01/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    @State var weather:Weathers


    var body: some View {

        ZStack{
            BackgroundView(isNight:$isNight)


            VStack(alignment: .center, spacing: 10){

                CityTextView()

                MainWeatherStatusView(SFImage: "cloud.sun.fill", temps: 32)

                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: "MON", temps: 36, SFImage: "cloud.sun.fill")
                    WeatherDayView(dayOfWeek: "TUE", temps: 26, SFImage: "cloud.moon.rain.fill")
                    WeatherDayView(dayOfWeek: "WED", temps: 29, SFImage: "cloud.sun.bolt.fill")
                    WeatherDayView(dayOfWeek: "THU", temps: 34, SFImage: "wind")
                    WeatherDayView(dayOfWeek: "FRI", temps: 32, SFImage: "smoke.fill")

                }

                Spacer()
                Button{
                    isNight.toggle()
                }label:{
                    Text("Change Day Time")
                        .font(.title2)
                        .frame(width: 280, height: 50)
                        .background(Color.white)

                }.cornerRadius(30)
                .shadow(radius: 2)
                Spacer()

            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
////    @State var weather:Weathers
//    static var previews: some View {
//        ContentView()
//    }
//}

struct WeatherDayView: View {
    let dayOfWeek:String
    let temps:Int
    let SFImage:String
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 15,weight:.medium,design:.default))
                .foregroundColor(.white)
                .padding()

            Image(systemName: SFImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40 ,height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            Text("\(temps)°C").font(.title3).bold().foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight:Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ?.black :.blue, isNight ? .gray :Color("lightblue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var body: some View {
        Text("Accra , GH ")
            .bold()
            .font(.system(size: 30,weight:.medium,design:.default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var SFImage:String
    var temps:Int

    var body: some View {
        VStack{
            Image(systemName: SFImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 140, alignment: .center)

            Text("\(temps)°C")
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.top,60)

        }
    }
}
