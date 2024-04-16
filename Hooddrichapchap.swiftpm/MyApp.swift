import SwiftUI
import Contacts

@main
struct MyApp: App {
    init() {
        FontManager.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            TstView1()
        }
    }
}

