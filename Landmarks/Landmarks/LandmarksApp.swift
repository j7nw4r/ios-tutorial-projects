//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by j on 5/25/24.
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
