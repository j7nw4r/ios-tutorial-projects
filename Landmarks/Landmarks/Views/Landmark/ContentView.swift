//
//  ContentView.swift
//  Landmarks
//
//  Created by j on 5/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkListView()
    }
}

#Preview("Hello World!") {
    ContentView()
        .environment(ModelData())
}

