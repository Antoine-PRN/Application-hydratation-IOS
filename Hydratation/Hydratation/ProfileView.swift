//
//  ProfileView.swift
//  Hydratation
//
//  Created by user235475 on 3/8/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var profile : ProfileViewModel
    
    @State var sex : Sex = .Men
    @State var age : Int = 0
    @State var size : String = ""
    @State var weight : String = ""
    @State var activity : String = ""
    
    
    var body: some View {
        Form {
            VStack (alignment: .leading){
                Group {
                    HStack (alignment: .center){
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 100))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    Text("Profile")
                        .font(.system(size: 33))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Group {
                    Text("Sex:")
                        .foregroundColor(.cyan)
                    Picker("Sex", selection: $sex) {
                        ForEach(Sex.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Stepper(value: $age, in: 0...120) {
                        Text("Age: \(age)")
                            .foregroundColor(.cyan)
                    }
                    .padding(.vertical)
                }
                Text("Size:")
                    .foregroundColor(.cyan)
                TextField("Enter your Size", text: $size)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                //.background(Color(.systemCyan))
                    .cornerRadius(20)
                
                Text("Weight:")
                    .foregroundColor(.cyan)
                TextField("Enter your weight (kg)", text: $weight)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                //.background(Color(.systemCyan))
                    .cornerRadius(20)
                
                Text("Activity Time:")
                    .foregroundColor(.cyan)
                TextField("Enter your Acitivty Time", text: $activity)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                    .cornerRadius(20)
                Spacer()
            }
            .padding(.horizontal)
            Button (action: {
                submitForm()
            }, label: {
                Text("Save")
            })
            .disabled(size.isEmpty || weight.isEmpty || activity.isEmpty)
        }
    }
    
    func submitForm () {
        profile.saveProfile(sex: sex, age: age, size: size, weight: weight, activity: activity)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
    }
}
