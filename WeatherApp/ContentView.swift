//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mobcoder Technologies Private Limited on 27/06/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HomeView(topEdge: UIApplication.shared.topSafeAreaInset)
            .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    ContentView()
}

extension UIApplication {
    var topSafeAreaInset: CGFloat {
        let keyWindow = connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first
        return keyWindow?.safeAreaInsets.top ?? 0
    }
}
