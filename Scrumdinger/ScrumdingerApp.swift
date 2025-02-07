//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Edgar Montero on 12/29/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
//    @State private var scrums = DailyScrum.sampleData
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    var body: some Scene {
        WindowGroup {
//            ScrumsView(scrums: $scrums)
            ScrumsView(scrums: $store.scrums){
                Task{
                    do {
                       try await store.save(scrums: store.scrums)
                   } catch {
//                       fatalError(error.localizedDescription)
                       errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                   }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
//                        fatalError(error.localizedDescription)
                        errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                    }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData

            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)

            }
        }
    }
}
