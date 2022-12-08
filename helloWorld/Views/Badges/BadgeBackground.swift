//
//  BadgeBackground.swift
//  helloWorld
//
//  Created by csy on 2022/12/5.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                var height: CGFloat = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(to: CGPoint(x: width * 0.95 + xOffset, y: height * (0.20 + HexagonParameters.adjustment)))
                
                HexagonParameters.segments.forEach{segment in
                    path.addLine(to: CGPoint(x: segment.line.x * width + xOffset, y: segment.line.y * height))
                    
                    path.addQuadCurve(to: CGPoint(x: segment.curve.x * width + xOffset, y: segment.curve.y * height), control: CGPoint(x: segment.control.x * width + xOffset, y: segment.control.y * height))
                }
            }
            .fill(.linearGradient(Gradient(colors: [Self.gradientStart, Self.gradientEnd]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.6)))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
