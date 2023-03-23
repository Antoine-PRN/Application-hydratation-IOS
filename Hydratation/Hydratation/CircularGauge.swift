//
//  CircularGauge.swift
//  Hydratation
//
//  Created by user235475 on 3/13/23.
//

import SwiftUI

struct CircularGauge: View {
    var value: Double
    var maxValue: Double
    var lineWidth: CGFloat = 25.0
    var body: some View {
        let progress = value / maxValue
        let percent = round(value * 100 / maxValue)
        let formattedPercent = String(format: "%.0f%%", percent)
        let formattedValue = String(format: "%.f mL", value)

        
        return ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            Circle()
                .trim(from : 0, to : CGFloat(min(progress, 1.0)))
                .stroke(Color.cyan, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: -90))
                .animation(.linear)
            VStack {
                Text(formattedPercent)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                Text(formattedValue)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
        }
    }
}

struct CircularGauge_Previews: PreviewProvider {
    static var previews: some View {
        CircularGauge(value: 1000, maxValue: 1500)
    }
}
