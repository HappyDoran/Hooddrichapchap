//
//  MapView.swift
//  Hooddrichapchap
//
//  Created by Doran on 3/21/24.
//

import SwiftUI
import MapKit


struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    
    @State var animalItems: [AnimalItem] = animalItemData
    
    @State private var cameraPosition: MapCameraPosition = .camera (
        MapCamera (
            centerCoordinate: CLLocationCoordinate2D(
                latitude: 36.0143,
                longitude: 129.3257
            ),
            distance: 980,
            heading: 242,
            pitch: 60
        )
    )
    
    @State private var toast: Toast? = nil
    
    @State var selectedAnimalId: UUID? = nil
    
    @State var tag:Int? = nil
    
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom){
                VStack{
                    Map(position : $cameraPosition) {
                        UserAnnotation()
                        MapCircle(center: locationManager.currentLocation ?? CLLocationCoordinate2D(
                            latitude: 36.0143,
                            longitude: 129.3257
                        ), radius: 200)
                        .foregroundStyle(.teal.opacity(0.2))
                        ForEach(animalItems, id: \.id) {animal in
                            Annotation(
                                animal.name,
                                coordinate: animal.coordinate,
                                anchor: .bottom
                            )
                            {
                                Button(action: {
                                    selectedAnimalId = animal.id
                                    withAnimation(.linear(duration: 0.01)) { // 1초 동안의 easeInOut 애니메이션 적용
                                        cameraPosition = .camera(
                                            MapCamera(
                                                centerCoordinate: animal.coordinate,
                                                distance: 980,
                                                heading: 242,
                                                pitch: 60
                                            )
                                        )
                                    }
                                }) {
                                    Image(animal.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .frame(width: isWithinMapCircle(animal: animal) ? 100 : 60 ,height: isWithinMapCircle(animal: animal) ? 100 : 60)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle().stroke(isWithinMapCircle(animal: animal) ? .blue: .gray, lineWidth: 4)
                                        }
                                }
                            }
                        }
                    }
                    .onAppear {
                        if let currentLocation = locationManager.currentLocation {
                            cameraPosition = .camera(
                                MapCamera(
                                    centerCoordinate: currentLocation,
                                    distance: 980,
                                    heading: 242,
                                    pitch: 60
                                )
                            )
                        }
                    }
                    .mapStyle(.standard(elevation: .realistic))
                    .mapControls {
                        MapUserLocationButton()
                        MapCompass()
                        MapScaleView()
                    }
                }
                
                
                if let selectedAnimalId = selectedAnimalId, let animal = animalItems.first(where: { $0.id == selectedAnimalId }) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.3)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            .transition(AnyTransition.opacity.animation(.easeInOut))
                            .foregroundColor(.white)
                        VStack{
                            HStack{
                                Image(animal.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100,height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 20).stroke(.blue, lineWidth: 4)
                                    }
                                    .padding()
                                VStack(alignment : .leading){
                                    Text("\(animal.name)(이)가 당신을 궁금해 해요")
                                        .font(.custom("Ownglyph_Dailyokja-Rg", size: 17))
                                    Text("호감도를 쌓아 \(animal.name)(과)와 친해지세요!")
                                        .font(.custom("Ownglyph_Dailyokja-Rg", size: 17))
                                }
                                
                            }
                            ZStack{
                                NavigationLink(destination: ChuView(animalItem: animal), tag: 1, selection: self.$tag) {
                                    EmptyView()
                                }
                                Button( action : {
                                    if (isWithinMapCircle(animal: animal)) {
                                        self.tag = 1
                                    }
                                    else {
                                        toast = Toast(style: .normal, message: "동물 친구가 멀리 있어요! \n가까이 다가가서 친해져봐요!")
                                    }
                                    //                                    self.tag = 1
                                }) {
                                    Text("교감하러 가기")
                                        .font(.custom("Ownglyph_Dailyokja-Rg", size: 24))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            .toastView(toast: $toast)
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    // 특정 animalItem이 MapCircle 내부에 위치하는지 판단하는 함수
    func isWithinMapCircle(animal: AnimalItem) -> Bool {
        let mapCircleCenter = locationManager.currentLocation ?? CLLocationCoordinate2D(latitude: 36.0143, longitude: 129.3257)
        let mapCircleCenterLocation = CLLocation(latitude: mapCircleCenter.latitude, longitude: mapCircleCenter.longitude)
        let animalLocation = CLLocation(latitude: animal.coordinate.latitude, longitude: animal.coordinate.longitude)
        
        let distance = mapCircleCenterLocation.distance(from: animalLocation)
        
        return distance <= 200 // 100m 이내에 위치하면 true 반환
    }
}

