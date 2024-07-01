//
//  Forecast.swift
//  WeatherApp
//
//  Created by Mobcoder Technologies Private Limited on 28/06/24.
//

import Foundation

struct DayForecast: Identifiable {
    var id = UUID().uuidString
    var day: String
    var fahrenheit: CGFloat
    var image: String
}

let dayForecasts: [DayForecast] = [
    DayForecast(day: "Moy", fahrenheit: 75, image: "sun.max"),
    DayForecast(day: "Tue", fahrenheit: 78, image: "cloud.sun"),
    DayForecast(day: "Wed", fahrenheit: 72, image: "cloud.drizzle"),
    DayForecast(day: "Thu", fahrenheit: 70, image: "cloud.rain"),
    DayForecast(day: "Fri", fahrenheit: 74, image: "cloud.bolt"),
    DayForecast(day: "Sat", fahrenheit: 77, image: "sun.max"),
    DayForecast(day: "Sun", fahrenheit: 79, image: "cloud.sun"),
    DayForecast(day: "Mon", fahrenheit: 80, image: "sun.max"),
    DayForecast(day: "Tue", fahrenheit: 73, image: "cloud"),
    DayForecast(day: "Wed", fahrenheit: 71, image: "cloud.rain")
]
