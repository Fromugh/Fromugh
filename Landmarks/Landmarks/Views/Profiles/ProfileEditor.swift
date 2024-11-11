//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Sungjae Heo on 11/6/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        HStack {
            Text("Username")
            Spacer()
            TextField("Username", text: $profile.username)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.trailing)
        }
        
        Toggle(isOn: $profile.prefersNotifications){
            Text("Enable Notifications")
        }
        
        Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
            ForEach(Profile.Season.allCases) { season in
                Text(season.rawValue).tag(season)
            }
        }
        
        DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
            Text("Goal Date")
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default)) // PrefiewProvider는 다른 View에서 값이 변화하는 것에 따라 Prefiew를 새로 그리는 데에는 무리가 있기 때문에 constant(_:)라는 Binding의 타입 메서드를 통해서 각 Binding 변수의 특정 값을 고정 값으로 제공한다. constant는 원하는 값을 인자로 넘겨주면 해당 값을 Binding 타입으로 return함.
}
