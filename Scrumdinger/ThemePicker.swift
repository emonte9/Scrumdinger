//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Edgar Montero on 12/31/24.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    var body: some View {
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases){theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePicker(selection: .constant(.periwinkle))
    
    
//    @State private var selectedTheme: Theme = .periwinkle
//        
//        var body: some View {
//            ThemePicker(selection: $selectedTheme) // Pass the binding to the picker
//        }
}
