//
//  File.swift
//  WeatherApp
//
//  Created by Mobcoder Technologies Private Limited on 28/06/24.
//

import Foundation
import Combine
import SwiftUI

class HomeInfoViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    ///@Published var weatherData = [Weather]()

    func getWeatherData() {
//        NetworkManager.shared.getData(endpoint: .current, type: Weather.self)
//            .sink { completion in
//                switch completion {
//                case .failure(let err):
//                    print("Error is \(err.localizedDescription)")
//                case .finished:
//                    print("Finished")
//                }
//            }
//        
//            receiveValue: { [weak self] weatherData in
//               //self?.weatherData = weatherData
//            }
//            .store(in: &cancellables)
    }
}
