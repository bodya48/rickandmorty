//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import SwiftUI

struct LoadingView: View {
    
    private let itemsNumber: Int = 20
    private var items: [String] { Array(repeating: "item", count: itemsNumber) }
    
    var body: some View {
        List(items.indices, id: \.self) { index in
            CharacterListItemView(character: MockDataProvider.characterRickSanchez)
                .listRowSeparator(.hidden)
        }
        .shimmer(when: .constant(true))
    }
}

#Preview {
    LoadingView()
}
