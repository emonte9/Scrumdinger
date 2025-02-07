//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Edgar Montero on 12/31/24.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int{
        secondsElapsed +  secondsRemaining
    }
    
    private var progress: Double{
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int{
        secondsRemaining/60
    }
    
    var body: some View {
        ProgressView(value: 5, total: 15)
            .progressViewStyle(ScrumProgressViewStyle(theme: theme))
        HStack{
            VStack(alignment: .leading){
                Text("Seconds Elapsed")
                    .font(.caption)
                Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
            }
            Spacer()
            VStack(alignment: .trailing){
                Text("Seconds Remaining")
                    .font(.caption)
                Label("600", systemImage: "hourglass.tophalf.fill")
                    .labelStyle(.trailingIcon)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
        
    }
}

#Preview (traits: .sizeThatFitsLayout){
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 100, theme: .bubblegum)
//        .previewLayout(.sizeThatFits)
}
