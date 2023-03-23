//
//  ContentView.swift
//  Hydratation
//
//  Created by user235475 on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var qte: Int = 0
    @EnvironmentObject var profile : ProfileViewModel
    
    var body: some View {
        let qte1 = 50
        let qte2 = 100
        let qte3 = 330
        let qte4 = 500
        
        var lastValuePercent = Int(qte * 100 / profile.getMaxValue())
        var lastValue = lastValuePercent < 100 ? lastValuePercent : 100
        
        let dataPoints = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        let values = [95, 80, 65, 85, 78, 100, lastValue]
        
        NavigationView {
            VStack {
                CircularGauge(value: Double(qte), maxValue: Double(profile.getMaxValue()))
                    .frame(maxWidth: 250)
                    .padding(20)
                Spacer()
                Group {
                    Text("Objectif personnel: \(String(profile.getMaxValue()))")
                    HorizontalGauge(value: Double(qte), maxValue: Double(profile.getMaxValue()))
                }
                Spacer()
                Group {
                    HStack {
                        Spacer()
                        Button (action: {
                            qte += Int(qte1)
                        }) {
                            AddButtonView(value: Double(qte1))
                                .frame(width: 60)
                        }
                        Spacer()
                        Button (action: {
                            qte += Int(qte2)
                        }) {
                            AddButtonView(value: Double(qte2))
                                .frame(width: 60)
                        }
                        Spacer()
                        Button (action: {
                            qte += Int(qte3)
                        }) {
                            AddButtonView(value: Double(qte3))
                                .frame(width: 60)
                        }
                        Spacer()
                        Button (action : {
                            qte += Int(qte4)
                        }) {
                            AddButtonView(value: Double(qte4))
                                .frame(width: 60)
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
            .navigationTitle("Hydratation")
            .toolbar {
                ToolbarItemGroup (placement: .bottomBar) {
                        Spacer()
                    NavigationLink(destination: StatsView(dataPoints: dataPoints, values: values)) {
                            VStack {
                                Image(systemName: "chart.bar")
                                    .foregroundColor(.black)
                                Text("Statistics")
                            }
                        }
                        Spacer()
                    NavigationLink(destination: ProfileView()) {
                            VStack {
                                Image(systemName: "person.crop.circle")
                                    .foregroundColor(.black)
                                Text("Profile")
                            }
                        }
                        Spacer()
                    }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProfileViewModel())
    }
}
