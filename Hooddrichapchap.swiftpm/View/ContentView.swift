import SwiftUI

struct ContentView: View {
    
    @State private var showMainView = false
    
    var body: some View {
        ZStack {
//            MapView()
            if showMainView {
                MapView()
            } else {
                LoadingView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }
            }
        }
    }
}
