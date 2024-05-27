//
//  FavoriteButtonView.swift
//  Landmarks
//
//  Created by j on 5/27/24.
//

import SwiftUI

struct FavoriteButtonView: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }, label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                 .labelStyle(.iconOnly)
                 .foregroundStyle(isSet ? .yellow : .gray)
        })
    }
}

#Preview {
    FavoriteButtonView(isSet: .constant(true))
}
