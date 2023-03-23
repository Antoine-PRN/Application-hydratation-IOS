//
//  HydratationApp.swift
//  Hydratation
//
//  Created by user235475 on 3/8/23.
//

import SwiftUI

@main
struct HydratationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ProfileViewModel())
        }
    }
}
