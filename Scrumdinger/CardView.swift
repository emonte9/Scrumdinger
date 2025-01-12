//
//  CardView.swift
//  Scrumdinger
//
//  Created by Edgar Montero on 12/29/24.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel(Text("\(scrum.attendees.count) attendees"))
                Spacer()
                Label("Label", systemImage: "clock")
                    .labelStyle(.trailingIcon).accessibilityLabel(Text("\(scrum.lengthInMinutes) minutes meeting"))
            }.font(.caption)
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let scrum = DailyScrum.sampleData[0]
    
    CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
        .frame(width: 400, height: 60)
    
}


//struct CardView_Previews: PreviewProvider {
//    static var scrum = DailyScrum.sampleData[0]
//    static var previews: some View {
//        CardView(scrum: scrum)
//            .background(scrum.theme.mainColor)
//            .previewLayout(.fixed(width: 400, height: 60))
//    }
//}
