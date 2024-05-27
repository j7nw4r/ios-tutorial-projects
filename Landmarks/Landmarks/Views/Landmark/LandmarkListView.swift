//
//  LandmarkListView.swift
//  Landmarks
//
//  Created by j on 5/26/24.
//

import SwiftUI

struct LandmarkListView: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false;
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    }
                    label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkListView()
        .environment(ModelData())
}
