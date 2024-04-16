//
//  FontManager.swift
//  Hooddrichapchap
//
//  Created by Doran on 3/24/24.
//

import Foundation
import SwiftUI

public struct FontManager {
    public static func registerFonts() {
        registerFont(
            bundle: Bundle.main,
            fontName: "Ownglyph_Dailyokja-Rg",
            fontExtension: ".ttf"
        )
    } 
    
    fileprivate static func registerFont(
        bundle: Bundle,
        fontName: String,
        fontExtension: String
    ) {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}


