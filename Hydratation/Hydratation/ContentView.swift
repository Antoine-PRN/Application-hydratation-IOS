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
        
        NavigationView {
            VStack {
                CircularGauge(value: Double(qte), maxValue: profile.getMaxValue())
                    .frame(maxWidth: 250)
                    .padding(20)
                Spacer()
                Group {
                    Text("Objectif personnel:")
                    HorizontalGauge(value: Double(qte), maxValue: 1500)
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
                        NavigationLink(destination: EmptyView()) {
                            VStack {
                                Image(systemName: "house")
                                    .foregroundColor(.black)
                                Text("Home")
                            }
                        }
                        Spacer()
                        NavigationLink(destination: EmptyView()) {
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
