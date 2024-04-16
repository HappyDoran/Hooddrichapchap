//
//  AnimalItemData.swift
//  Hooddrichapchap
//
//  Created by Doran on 3/21/24.
//

import Foundation
import MapKit
import SwiftUI


class AnimalItem : ObservableObject {
    let id: UUID
    let name: String
    let title: String
    let imageName: String
    @Published var level: Int
    @Published var heartCount : Int
    @Published var isLike : Bool
    let fColor: Color
    let experiment: Int
    let coordinate: CLLocationCoordinate2D
    
    // 클래스의 초기화 메서드
    init(name: String, title: String, imageName: String, level: Int, heartCount:Int, isLike: Bool, fColor : Color, experiment: Int, coordinate: CLLocationCoordinate2D) {
        self.id = UUID()
        self.name = name
        self.title = title
        self.imageName = imageName
        self.level = level
        self.heartCount = heartCount
        self.isLike = isLike
        self.fColor = fColor
        self.experiment = experiment
        self.coordinate = coordinate
    }
}

var animalItemData: [AnimalItem] = [
    AnimalItem(name: "세종", title: "C5 귀염둥이", imageName: "SejongCat", level: 1, heartCount: 0, isLike: false, fColor: Color.orange, experiment: 0, coordinate: CLLocationCoordinate2D.sejongCat),
    AnimalItem(name: "중앙", title: "지곡회관 마스코트", imageName: "ChungAngDog", level: 1, heartCount: 0, isLike: false, fColor: Color.purple, experiment: 0, coordinate: CLLocationCoordinate2D.chungangDog),
    AnimalItem(name: "포비", title: "기숙사 지킴이", imageName: "PolarBear", level: 1, heartCount: 0, isLike: false, fColor: Color.blue, experiment: 0, coordinate: CLLocationCoordinate2D.polarBear)
]
