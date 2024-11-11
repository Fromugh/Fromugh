//
//  Landmark.swift
//  Landmarks
//
//  Created by Sungjae Heo on 8/23/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, Codable, CaseIterable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    private var imageName: String
    var image: Image { // image 변수는 Landmark 구조체의 각 인스턴스에 해당하는 imageName 변수가 저장되면 이에 해당하는 Image 뷰로 리턴함.(imageName에는 저장된 이미지의 파일 이름에 해당하는 값들이 저장되어 있음)
        Image(imageName)
    }
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature" ) : nil
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
