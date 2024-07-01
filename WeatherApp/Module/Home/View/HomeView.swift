//
//  HomeView.swift
//  WeatherApp
//
//  Created by Mobcoder Technologies Private Limited on 27/06/24.
//

import SwiftUI


struct HomeView: View {
    
    // MARK: - Properties
    
    @State private var offset: CGFloat = 0
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    private var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var topEdge: CGFloat = 0
    
    var body: some View {
        ZStack {
            Image("sky")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenWidth, height: screenHeight, alignment: .center)
                .overlay(.ultraThinMaterial.opacity(0.8))
            
            ScrollView(.vertical) {
                VStack {
                    // Weather Data
                    VStack(alignment: .center, spacing: 5, content: {
                        Text("San Jose")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                        
                        Text("98")
                            .font(.system(size: 45))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacityt())
                        
                        Text("Cloudy")
                            .foregroundStyle(.secondary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacityt())
                        
                        Text("H: 103,L: 105")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacityt())
                        
                    })
                    .offset(y: -offset)
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
                    
                    VStack(spacing: 8, content: {
                        VStack {
                            ForEach(1...1, id: \.self) {_ in
                                CustomStackView {
                                    Label("Hourly Forecast", systemImage: "clock")
                                } contentView: {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 15) {
                                            ForecastView(time: "9 PM", celcius: 98, image: "sun.min")
                                            ForecastView(time: "10 PM", celcius: 97, image: "moon")
                                            ForecastView(time: "11 PM", celcius: 96, image: "cloud.moon")
                                            ForecastView(time: "11 PM", celcius: 96, image: "cloud.moon")
                                            ForecastView(time: "11 PM", celcius: 96, image: "cloud.moon")
                                            ForecastView(time: "11 PM", celcius: 96, image: "cloud.moon")
                                            ForecastView(time: "11 PM", celcius: 96, image: "cloud.moon")
                                            ForecastView(time: "11 PM", celcius: 96, image: "cloud.moon")
                                        }
                                    }
                                }

                            }
                        }
                        
                        WeatherDataView()
                    })
                }
                .padding(.top, 25)
                .padding(.top, topEdge)
                .padding([.horizontal, .bottom])
                .overlay {
                    GeometryReader { geometry -> Color in
                        let minY = geometry.frame(in: .global).minY
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        
                        return Color.clear
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private func getTitleOpacityt() -> CGFloat {
        let titleOffset = -getTitleOffset()
        let progress = titleOffset / 20
        let opacity = 1 - progress
        return opacity
    }
    
    private func getTitleOffset() -> CGFloat {
        if offset < 0 {
            let progress = -offset / 120
            
            let newOffset = (progress <= 1.0 ? progress : 1) * 20
            return -newOffset
        }
        
        return 0
    }
}

#Preview {
    ContentView()
}

struct ForecastView: View {
    
    //MARK: - Properties
    
    let time: String
    let celcius: CGFloat
    let image: String
    
    var body: some View {
        VStack(spacing: 15) {
            Text(time)
                .font(.callout).bold()
                .foregroundStyle(.white)
            
            Image(systemName: image)
                .font(.title2)
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .white)
                .frame(height: 30)
            
            Text("\(Int(celcius))")
                .font(.callout).bold()
                .foregroundStyle(.white )
            
        }
    }
}

struct CornerModifier: ViewModifier {
    @Binding var bottomOffset: CGFloat
    
    func body(content: Content) -> some View {
        if bottomOffset < 38 {
            content
        } else {
            content
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

