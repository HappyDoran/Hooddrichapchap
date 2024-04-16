//
//  AnimalDetailView.swift
//  Hooddrichapchap
//
//  Created by Doran on 3/24/24.
//

import SwiftUI

struct AnimalDetailView: View {
    var animal: AnimalItem
    
    var body: some View {
        Image(animal.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100,height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20).stroke(.blue, lineWidth: 4)
            }
            .padding()
        VStack(alignment: .leading){
            Text("\(animal.name)(이)가 당신을 궁금해 해요").font(.custom("Ownglyph_Dailyokja-Rg", size: 17))
            Text("호감도를 쌓아 \(animal.name)(과)와 친해지세요!").font(.custom("Ownglyph_Dailyokja-Rg", size: 17))
        }
    }
}

//#Preview {
//    AnimalDetailView()
//}
