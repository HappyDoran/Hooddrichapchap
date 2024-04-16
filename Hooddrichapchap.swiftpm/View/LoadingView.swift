//
//  SwiftUIView.swift
//  
//
//  Created by Doran on 3/24/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("hooddrichapchap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width-40)
            }
        }
    }
}

#Preview {
    LoadingView()
}
