//
//  CharacterListItemView.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import SwiftUI
import asnycImage

struct CharacterListItemView: View {
    
    private var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        HStack(spacing: 10) {
            CAsyncImage(urlString: character.image) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Rectangle()
                    .fill(.gray)
                    .frame(width: 60, height: 60)
                    .shimmer(when: .constant(true))
            }
            .frame(width: 60, height: 60)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.headline)
                HStack {
                    StatusView(status: character.status)
                        .frame(width: 10, height: 10)
                    Text("\(character.status.rawValue) - \(character.species)")
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    CharacterListItemView(
        character: MockDataProvider.characterRickSanchez)
}
