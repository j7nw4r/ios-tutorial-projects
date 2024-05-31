//
//  ContentView.swift
//  Landmarks
//
//  Created by j on 5/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView (selection: $selection){
            CategoryHome()
                .tabItem { Label("Featured", systemImage: "star") }
                .tag(Tab.featured)
            
            LandmarkListView()
                .tabItem { Label("List", systemImage: "list.bullet") }
                .tag(Tab.list)
        }
    }
}

#Preview("Hello World!") {
    ContentView()
        .environment(ModelData())
}

