//
//  ChuView.swift
//  Hooddrichapchap
//
//  Created by Doran on 3/21/24.
//

import SpriteKit
import SwiftUI
import AVFoundation

struct ChuView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var animalItem: AnimalItem
    
    @State private var cnt = 0
    
    @StateObject private var AnimationViewModel: GameViewModel = GameViewModel(sceneSize: UIScreen.main.bounds.size)

    
    @State private var audioPlayer: AVAudioPlayer?
    
//    @ObservedObject private var AnimationViewModel: GameViewModel
//    
//    init(animalItem: AnimalItem) {
//        self.animalItem = animalItem
//        self.AnimationViewModel = GameViewModel(sceneSize: UIScreen.main.bounds.size, fColor: UIColor(animalItem.fColor))
//    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                SpriteView(scene: AnimationViewModel.scene)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
//                SpriteView(scene: scene)
//                            .frame(width: 300, height: 400)
//                            .ignoresSafeArea()
                VStack {
                    HStack{
                        VStack(alignment: .leading){
                            Text(animalItem.name)
                                .font(.custom("Ownglyph_Dailyokja-Rg", size: 40))
//                                .foregroundColor(.white)
                                .foregroundColor(.black)
                            Text(animalItem.title)
                                .font(.custom("Ownglyph_Dailyokja-Rg", size: 20))
//                                .foregroundColor(.white)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Button(action: {
                            self.animalItem.isLike.toggle()
                        }){
                            Image(systemName : animalItem.isLike ? "bookmark.fill" : "bookmark")
                                .resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width: 30,height: 30)
                                .offset(CGSize(width: 0, height: 0))
                            //                            .foregroundColor(.white)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.horizontal, 30)
                    ZStack{
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 350 ,height: 360)
                            .foregroundColor(.white)
                            .opacity(0.5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(Color.white, lineWidth: 4)
                            )
                        Image("\(animalItem.imageName)_BackOut")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .onTapGesture {
                                playSound()
                            }
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 350,height: 120)
                            .offset(CGSize(width: 0, height: 120))
                            .foregroundColor(.white)
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80,height: 80)
                                //                        .offset(CGSize(width: -90, height: 90))
                                    .foregroundColor(.white)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                Text("Lv_\(String(animalItem.level))")
                                    .font(.custom("Ownglyph_Dailyokja-Rg", size: 27))
                                    .foregroundColor(.black)
                            }
                            
                            VStack{
                                Text("당신과의 친밀도")
                                    .font(.custom("Ownglyph_Dailyokja-Rg", size: 20))
                                
                                HStack{
                                    ForEach(0..<5) { index in
                                        // cnt를 2로 나눈 나머지로 하트의 상태 결정
                                        Image(self.heartImageName(for: index))
                                            .foregroundColor(index < (animalItem.heartCount + 1) / 2 ? .red: .gray)
                                    }
                                }
                            }
                        }
                        .offset(CGSize(width: -30, height: 120))
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("친해지기")
                                    .font(.custom("Ownglyph_Dailyokja-Rg", size: 25))
                                    .foregroundColor(.white)
                                Text("다양한 행동으로 동물들과 가까워져 봐욤")
                                    .font(.custom("Ownglyph_Dailyokja-Rg", size: 14))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 30)
                    HStack{
                        Button(action: {
                            animalButton(target: "Food_2")
                        }) {
                            Image("Food")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 110, height: 110)
                        }.buttonStyle(AnimalButtonStyle())

                        Button(action: {
                            animalButton(target: "Play_2")
                        }) {
                            Image("Play")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 110, height: 110)
                        }.buttonStyle(AnimalButtonStyle())

                        Button(action: {
                            animalButton(target: "Like_2")
                        }) {
                            Image("Like")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 85)
                                .frame(width: 110, height: 110)
                        }.buttonStyle(AnimalButtonStyle())
                    }.padding(.horizontal, 30)
                }
                .ignoresSafeArea()
                .onDisappear{
                    audioPlayer?.stop()
//                    AnimationViewModel.scene.clearAllBoxes()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28,height: 28)
                        .foregroundColor(.black)
                })
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func animalButton(target : String){
        AnimationViewModel.dropBoxes(imageName: target)
        animalItem.heartCount += 1
        
        if animalItem.heartCount >= 10 {
            animalItem.heartCount = 0
            animalItem.level+=1
        }
    }
    
    func heartImageName(for index: Int) -> String {
        let heartIndex = animalItem.heartCount / 2
        if index < heartIndex {
            return "Full_Heart"
        } else if index == heartIndex && animalItem.heartCount % 2 != 0 {
            return "Half_Heart"
        } else {
            return "Empty_Heart"
        }
    }
    
    // 음성 파일을 재생하는 메서드
    func playSound() {
        // 음성 파일의 경로를 가져옵니다.
        guard let path = Bundle.main.path(forResource: "DOG BARKING", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            // AVAudioPlayer 인스턴스를 생성하고 초기화합니다.
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()  // 음성 파일을 재생합니다.
        } catch {
            // 에러 처리
            print("음성 파일을 재생할 수 없습니다.")
        }
    }
}

struct AnimalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                }
            )
            .frame(width: 110, height: 110)
    }
}


