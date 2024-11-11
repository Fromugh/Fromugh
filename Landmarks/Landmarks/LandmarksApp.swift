//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Sungjae Heo on 8/21/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
