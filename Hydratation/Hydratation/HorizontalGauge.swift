//
//  HorizontalGauge.swift
//  Hydratation
//
//  Created by user235475 on 3/13/23.
//

import SwiftUI

struct HorizontalGauge: View {
    var value : Double
    var maxValue: Double
    var lineWidth: CGFloat = 20
    
    var body: some View {
        let progress = value / maxValue
        let percent = value * 100 / maxValue
        let formattedPercent = String(format: "%.0f%%", percent)
        let formattedValue = String(format: "%.0f mL", value)
        return HStack {
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame (width: 300, height: lineWidth)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                        .cornerRadius(lineWidth/2)
                    
                    Rectangle()
                        .frame(width: 300 * CGFloat(min(progress, 1.0)), height: lineWidth)
                        .foregroundColor(Color.cyan)
                        .animation(.linear)
                        .cornerRadius(lineWidth/2)
                    
                    Text(formattedValue)
                        .padding(.horizontal)
                        .foregroundColor(Color.white)
                }
                Text(formattedPercent)
            }
        }
}

struct HorizontalGauge_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalGauge(value: 1000, maxValue: 1500)
    }
}
