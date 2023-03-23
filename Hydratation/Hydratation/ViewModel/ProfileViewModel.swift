//
//  ProfileViewModel.swift
//  Hydratation
//
//  Created by user235475 on 3/20/23.
//

import Foundation


class ProfileViewModel: ObservableObject {
    @Published var profile : Profile
    
    init () {
        profile = Profile(sex: .Men, age: 18, size: "180", weight: "65", activity: "1")
    }
    
    func saveProfile(sex: Sex, age: Int, size: String, weight: String, activity: String) {
        profile = Profile(sex: sex, age: age, size: size, weight: weight, activity: activity)
    }
    
    func getMaxValue() -> Double {
        if profile.sex Men {
            return 2000// 3.7 //+ (0.035 * Double(profile.weight) ?? 0.0) + (0.045 * Double(profile.size) ?? 0.0) - (0.033 * profile.age) + (750 * Double(profile.activity) ?? 0.0)
        }
        return 1500// 2.7 //+ (0.03 * Double(profile.weight) ?? 0.0) + (0.04 * Double(profile.size) ?? 0.0) - (0.28 * profile.age) + (750 * Double(profile.activity) ?? 0.0)
    }
}
