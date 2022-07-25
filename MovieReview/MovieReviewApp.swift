//
//  MovieReviewApp.swift
//  MovieReview
//
//  Created by 정유진 on 2022/07/25.
//

import SwiftUI

@main
struct MovieReviewApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
