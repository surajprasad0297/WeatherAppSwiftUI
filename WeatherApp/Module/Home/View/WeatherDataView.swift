//
//  WeatherDataView.swift
//  WeatherApp
//
//  Created by Mobcoder Technologies Private Limited on 28/06/24.
//

import SwiftUI

struct WeatherDataView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            CustomStackView {
                Label(
                    title: { Text("Air Quality") },
                    icon: { Image(systemName: "circle.hexagongrid.fill") }
                )
            } contentView: {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("143 - Moderatied Polluted")
                        .font(.title.bold())
                    
                    Text("sdg ergr erh fj  hytdj rtj j yjt yjtyj ytj yjt tyj wstj ydj tydj tyej tyj tyj tydj yjt ytj tyks ktyk teyk tyek tyek ytkdkj stj dmyj dtyj td")
                        .fontWeight(.semibold)
                })
                .foregroundStyle(Color.white)
            }
            
            HStack {
                CustomStackView {
                    Label(
                        title: { Text("UUV Index") },
                        icon: { Image(systemName: "sun.min") }
                    )
                } contentView: {
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("0")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Low")
                            .font(.title)
                            .fontWeight(.semibold)
                    })
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                
                CustomStackView {
                    Label(
                        title: { Text("Rainfall") },
                        icon: { Image(systemName: "drop.fill") }
                    )
                } contentView: {
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("0 mm")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("In last 24 hours")
                            .font(.title3)
                            .fontWeight(.semibold)
                    })
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
            }
            .frame(maxHeight: .infinity)
            
            CustomStackView {
                Label(
                    title: { Text("10 Day Forecast") },
                    icon: { Image(systemName: "calendar") }
                )
            } contentView: {
                VStack(alignment: .leading, spacing: 10, content: {
                    ForEach(dayForecasts) { cast in
                        VStack {
                            HStack(spacing: 15, content: {
                                Text(cast.day)
                                    .font(.title3.bold())
                                    .foregroundStyle(Color.white)
                                    .frame(width: 60, alignment: .leading)
                                
                                Image(systemName: cast.image)
                                    .font(.title3)
                                    .symbolVariant(.fill)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.yellow, .white)
                                    .frame(width: 30)
                                
                                Text("\(Int(cast.fahrenheit - 8))")
                                    .font(.title3.bold())
                                    .foregroundStyle(.secondary)
                                    .foregroundStyle(.white)
                                
                                // Progress Bar
                                ZStack(content: {
                                    Capsule()
                                        .fill(.tertiary)
                                        .foregroundStyle(.white)
                                    
                                    // For width
                                    GeometryReader(content: { geometry in
                                        Capsule()
                                            .fill(LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .leading, endPoint: .trailing))
                                            .frame(width: (cast.fahrenheit / 140) * geometry.size.width)
                                    })
                                })
                                .frame(height: 4)
                                
                                Text("\(Int(cast.fahrenheit))")
                                    .font(.title3.bold())
                                    .foregroundStyle(.secondary)
                                    .foregroundStyle(.white)
                            })
                            Divider()
                        }
                        .padding(.vertical, 8)
                    }
                })
            }


        }
    }
}

#Preview {
    WeatherDataView()
}
