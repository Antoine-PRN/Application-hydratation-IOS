//
//  AddButtonView.swift
//  Hydratation
//
//  Created by user235475 on 3/15/23.
//

import SwiftUI

struct AddButtonView: View {
    
    var value : Double
    
    var body: some View {
        let formattedValue = String(format: "%.0fmL", value)
            VStack {
                ZStack {
                    Circle ()
                        .foregroundColor(.cyan)
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                }
                Text(formattedValue)
                    .font(.system(size: 20))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(value: 100)
    }
}
