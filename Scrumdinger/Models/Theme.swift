//
//  Theme.swift
//  Scrumdinger
//
//  Created by Edgar Montero on 12/29/24.
//

//import Foundation
//import SwiftUICore

import SwiftUI


enum Theme: String, CaseIterable, Identifiable, Codable  {
    
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    
    var accentColor: Color {
        switch self {
            case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
            
            case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    
    var mainColor: Color {
//        Color(rawValue)
        switch self {
           case .bubblegum: return Color.pink
           case .buttercup: return Color.yellow
           case .indigo: return Color.blue
           case .lavender: return Color.purple
        case .magenta: return Color(red: 1.0, green: 0.0, blue: 1.0) // Custom magenta
           case .navy: return Color.blue.opacity(0.5)
           case .orange: return Color.orange
           case .oxblood: return Color.red
           case .periwinkle: return Color.blue.opacity(0.3)
           case .poppy: return Color.red
           case .purple: return Color.purple
           case .seafoam: return Color.green.opacity(0.5)
           case .sky: return Color.blue
           case .tan: return Color.brown
           case .teal: return Color.teal
           case .yellow: return Color.yellow
        }
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String{
        name
    }
  

}
