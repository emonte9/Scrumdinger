//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Edgar Montero on 12/30/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void
    var body: some View {
        NavigationStack{
            List($scrums){ $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
                
            }
            .navigationTitle("Daily Scrums")
            .toolbar{
                Button(action: {
                    isPresentingNewScrumView = true
                }){
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView){
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .onChange(of: scenePhase) {
                if scenePhase == .inactive {
                    saveAction()
                }
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}



//struct ScrumsView: View {
//    @Binding var scrums: [DailyScrum]
//    var body: some View {
//        if #available(iOS 16.0, *) {
//            ScrumsStackView(scrums: $scrums)
//        } else {
//            NavigationView {
//                ScrumsList(scrums: $scrums)
//            }
//        }
//    }
//}
