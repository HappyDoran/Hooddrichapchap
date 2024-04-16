//
//  ToastStyle.swift
//  Hooddrichapchap
//
//  Created by Doran on 3/25/24.
//

import Foundation
import SwiftUI

struct Toast: Equatable {
    var style: ToastStyle
    var message: String
    var duration: Double = 3
    var width: Double = .infinity
}

enum ToastStyle {
    case error
    case warning
    case success
    case info
    case normal
}

extension ToastStyle {
    var themeColor : Color {
        switch self {
        case .error : return Color.red
        case .warning : return Color.orange
        case .info : return Color.blue
        case .success : return Color.green
        case .normal : return Color.white
        }
    }
}
