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
    
    func getMaxValue() -> Int {
        let activity_qte = (Double(profile.activity) ?? 0.0) * 0.25
        if profile.sex == .Men {
            return Int((Double(profile.weight) ?? 0.0) / 30 * 1.7 + activity_qte) * 1000
        }
        return Int((Double(profile.weight) ?? 0.0) / 30 * 1.5 + activity_qte) * 1000
    }
}
