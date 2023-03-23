//
//  ProfileModel.swift
//  Hydratation
//
//  Created by user235475 on 3/13/23.
//

import Foundation

enum Sex : String, CaseIterable {
    case Men
    case Women
}


struct Profile {
    var sex: Sex
    var age: Int
    var size: String
    var weight: String
    var activity: String
}
