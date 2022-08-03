//
//  ReviewsView.swift
//  MovieReview
//
//  Created by 정유진 on 2022/08/01.
//

import SwiftUI

struct ReviewsView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State var searchQuery = ""
    var reviews: [String] = [
        "[영화] 헤어질 결심: 박찬욱의 대중영화",
        "[도서] 다정한 것이 살아남는다.",
        "[영화] 탑건2: 톰크루즈의 멈추지 않는 비행",
        "[잡담] 즐거운 앱 만들기 with SwiftUI"
    ]
    var body: some View {
        ZStack {
            List {
                ForEach(reviews, id: \.count) { review in
                    NavigationLink(destination: ReviewDetailView(isEditing: .read,
                                                                 review: review)) {
                      Text(review)
                    }
                }
            }
            .listStyle(.inset)
            .padding()
            VStack {
                // floating button
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: ReviewDetailView(isEditing: .create,
                                                                review: nil)) {
                        Text("+")
                            .font(.system(.largeTitle))
                            .frame(width:65, height: 60)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                            
                    }
                                                                .background(Color.pink)
                                                                .cornerRadius(35)
                                                                .padding()
                                                                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
                }
            }
        }
        .navigationTitle("my crumbles")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .destructiveAction) {
                Button("delete") {
                    // delete action 함수로 빼자
                }
            }
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
