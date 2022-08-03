//
//  ContentView.swift
//  MovieReview
//
//  Created by 정유진 on 2022/07/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            ReviewsView()
                .tint(Color("green"))
                .environment(\.managedObjectContext, viewContext)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
