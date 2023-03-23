//
//  BarChartView.swift
//  Hydratation
//
//  Created by perrin antoine on 23/03/2023.
//

import SwiftUI

struct BarChartView: View {
    var data : [Double] = [75, 35, 68, 12, 42, 16, 71]
    var maxValue = data.max() ?? 0
    
    var body: some View {
        HStack (alignment: .bottom) {
            ForEach(data, id: \.self) { value in
                SingleBarView(value: <#T##Double#>, maxValue: <#T##Double#>)
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
