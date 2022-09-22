//
//  ReviewDetailView.swift
//  MovieReview
//
//  Created by 정유진 on 2022/08/01.
//

import SwiftUI

enum DetailViewState: String {
    case create
    case read
    case update
    case delete
}

struct ReviewDetailView: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    @State var isEditing: DetailViewState = .read
    var review: String?
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink(destination: Text(name)) {
                            Text(name)
                        }
                    }
                }
                .hidden()
                
                VStack {
                    Text("\(searchText)")
                    Image(uiImage:  UIImage(systemName: "camera.macro")!)
                    Button("image search") {
                        print("image url load")
                    }
                }
            }
            .searchable(text: $searchText,
                        placement: .automatic,
                        prompt: "let's search") {
                ForEach(searchResults, id: \.self) { result in
                    Text("Are you looking for \(result)?")
                        .searchCompletion(result)
                }
            }
            .navigationTitle("Detail")
            .frame(minHeight: 0,maxHeight:.infinity)
            .onSubmit(of: .search) {
                print("start")
            }
        }
    }
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct ReviewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDetailView(review: "[도서] 코스모스: 우주와 인문학")
    }
}
