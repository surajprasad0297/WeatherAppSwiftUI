//
//  CustomStackView.swift
//  WeatherApp
//
//  Created by Mobcoder Technologies Private Limited on 27/06/24.
//

import SwiftUI

struct CustomStackView<Title: View, Content: View>: View {
    
    var titleView: Title
    var contentView: Content
    
    @State private var topOffset: CGFloat = 0
    @State private var bottomOffset: CGFloat = 0
    
    init(@ViewBuilder titleView: @escaping() -> Title, @ViewBuilder contentView: @escaping() -> Content) {
        self.titleView = titleView()
        self.contentView = contentView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            titleView
                .font(.callout)
                .lineLimit(1)
                .frame(height: 38)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(.ultraThinMaterial, in: CustomCorner(corners: bottomOffset < 38 ? .allCorners : [.topLeft, .topRight], radius: 12))
                .zIndex(1)
            
            VStack {
                Divider()
                
                contentView
                    .padding()
            }
            .background(.ultraThinMaterial, in: CustomCorner(corners: [.bottomLeft, .bottomRight], radius: 12))
            .opacity(getOpacity())
            // Moving Content Up
            .offset(y: topOffset >= 120 ? 0 : -(-topOffset + 120))
            .zIndex(0)
        }
        .preferredColorScheme(.dark)
        .cornerRadius(12)
        // Stopping View @120
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .opacity(getOpacity())
        .offset(y: topOffset >= 120 ? 0 : -topOffset + 120)
        .background(
            GeometryReader { geometry -> Color in
                let minY = geometry.frame(in: .global).minY
                let maxY = geometry.frame(in: .global).maxY
                DispatchQueue.main.async {
                    self.topOffset = minY
                    
                    self.bottomOffset = maxY - 120
                }
                
                return Color.clear
            })
        .modifier(CornerModifier(bottomOffset: $bottomOffset))
    }
    
    private func getOpacity() -> CGFloat {
        if bottomOffset < 28 {
            let progress = bottomOffset / 20
            return progress
        }
        
        return 1
    }
}

#Preview {
    ContentView()
}
