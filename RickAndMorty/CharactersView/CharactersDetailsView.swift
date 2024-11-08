//
//  CharactersDetailsView.swift
//  RickAndMorty
//
//  Created by bod on 11/6/24.
//

import SwiftUI
import asnycImage

struct CharactersDetailsView: View {
    
    private var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            characterName
            
            HStack(alignment: .top, spacing: 10) {
                imageView
                
                VStack(alignment: .leading, spacing: 0) {
                    status
                        .padding(.top, 14)
                    lastLocation
                        .padding(.top, 8)
                    originLocation
                        .padding(.top, 10)
                }
                Spacer()
            }
            .background(Color(uiColor: .systemGray6).clipShape(RoundedRectangle(cornerRadius:8)))
            Spacer()
        }
    }
}

#Preview {
    CharactersDetailsView(character: MockDataProvider.characterRickSanchez)
}

extension CharactersDetailsView {
    
    private var imageView: some View {
        CAsyncImage(urlString: character.image) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Rectangle()
                .fill(.gray)
                .frame(width: 150, height: 150)
                .shimmer(when: .constant(true))
        }
        .frame(width: 150, height: 150)
        .clipShape(.rect(topLeadingRadius: 8, bottomLeadingRadius: 8))
    }
    
    private var characterName: some View {
        Text(character.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding([.leading, .top])
    }
    
    private var status: some View {
        HStack {
            StatusView(status: character.status)
                .frame(width: 10, height: 10)
            Text("\(character.status.rawValue) - \(character.species)")
                .font(.subheadline)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .padding(.bottom, 4)
    }
    
    private var lastLocation: some View {
        VStack(alignment: .leading) {
            Text("Last known location:")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text(character.location.name)
                .font(.headline)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
    }
    
    private var originLocation: some View {
        VStack(alignment: .leading) {
            Text("First seen in:")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text(character.origin.name)
                .font(.headline)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
    }
    
}
