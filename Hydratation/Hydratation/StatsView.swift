//
//  StatsView.swift
//  Hydratation
//
//  Created by perrin antoine on 23/03/2023.
//

import SwiftUI

struct StatsView: View {
    let dataPoints : [String]
    let values : [Int]
    let title = "Statistics"
    
    var body: some View {
        var message = values.last == 100 ? "Conratulations !" : "You can do it !"

        VStack {
            Text(title)
                .font(.headline)
            HStack (alignment: .bottom, spacing : 10) {
                ForEach(0..<dataPoints.count, id: \.self) { index in
                    VStack {
                        ZStack (alignment: .bottom)
                        {
                            Capsule()
                                .frame(width: 40, height: 300)
                                .foregroundColor(.gray.opacity(0.5))
                            Capsule()
                                .frame(width: 40, height: CGFloat(values[index]) * 3)
                                .foregroundColor(Color.cyan)
                            
                        }
                        Text(dataPoints[index])
                            .font(.caption)
                            .padding(.top, 4)
                    }
                }
            }
            Text(message)
                .foregroundColor(.cyan)
                .padding(.top, 10)
                .font(.title)
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(dataPoints: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], values: [20, 30, 10, 40, 50, 15, 25])
    }
}
