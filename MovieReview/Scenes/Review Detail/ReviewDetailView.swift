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
    @State var isEditing: DetailViewState = .read
    var review: String?
    var body: some View {
        switch isEditing {
        case .create:
            Text("create view")
        case .read:
            Text("read view")
        case .update:
            Text("update view")
        case .delete:
            Text("delete view")
        }
    }
}

struct ReviewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDetailView(review: "[도서] 코스모스: 우주와 인문학")
    }
}
