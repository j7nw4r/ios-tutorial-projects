//
//  Landmark.swift
//  Landmarks
//
//  Created by j on 5/25/24.
//

import Foundation
import CoreLocation
import SwiftUI

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var city: String
    var category: String
    var state: String
    var isFeatured: Bool
    var isFavorite: Bool
    var park: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}