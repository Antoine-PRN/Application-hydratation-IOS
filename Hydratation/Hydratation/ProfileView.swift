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
    @State var objective = ""
    
    @State var showAlert = false
    
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
                Group {
                    Text("Size: (cm)")
                        .foregroundColor(.cyan)
                    TextField("Enter your Size", text: $size)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray4))
                        .cornerRadius(20)
                        .keyboardType(.numberPad)
                        
                    Text("Weight: (kg)")
                        .foregroundColor(.cyan)
                    TextField("Enter your weight", text: $weight)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray4))
                        .cornerRadius(20)
                        .keyboardType(.numberPad)
                        
                }
                Text("Activity Time: (h/week)")
                    .foregroundColor(.cyan)
                TextField("Enter your Acitivty Time", text: $activity)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                    .cornerRadius(20)
                
                Text("What is your objective ? (ml/day)")
                    .foregroundColor(.cyan)
                TextField("Enter your objective here", text: $objective)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                    .cornerRadius(20)
                    .keyboardType(.numberPad)
                Spacer()
            }
            .padding(.horizontal)
            Button (action: {
                submitForm()
                self.showAlert = true
            }, label: {
                Text("Save")
            })
            .disabled(size.isEmpty || weight.isEmpty || activity.isEmpty)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Informations Saved"), message: Text("Your informations have been saved successfully"))
            }
        }
        .onAppear() {
            sex = profile.profile.sex
            age = profile.profile.age
            weight = profile.profile.weight
            size = profile.profile.size
            activity = profile.profile.activity
            objective = profile.profile.objective
        }
        .padding(.top, -32)
        Spacer()
    }
    
    func submitForm () {
        profile.saveProfile(sex: sex, age: age, size: size, weight: weight, activity: activity, objective: objective)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
    }
}
