//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Edgar Montero on 12/30/24.
//

import SwiftUI

struct DetailEditView: View {
    //@State private var scrum = DailyScrum.emptyScrum
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    
    
    var body: some View {
        Form {
            Section (header: Text("Meeting Info")){
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value:  $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1){
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutesAsDouble) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                
                ThemePicker(selection: $scrum.theme)
                
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }.onDelete{indices in
                    scrum.attendees.remove(atOffsets: indices)
                    
                }
                HStack{
                    TextField("New Attedee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attedee")
                        
                    }.disabled(newAttendeeName.isEmpty)
                    
                }
                
                
            }
        }
        }
}


#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
