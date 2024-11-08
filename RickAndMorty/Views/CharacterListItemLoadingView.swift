//
//  CharacterListItemLoadingView.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import SwiftUI

struct CharacterListItemLoadingView: View {
    
    var body: some View {
        HStack(spacing: 10) {
            Rectangle()
                .fill(.gray)
                .frame(width: 60, height: 60)
            
            Text("some character name")
                .font(.headline)
        }
        .shimmer(when: .constant(true))
    }
}

#Preview {
    CharacterListItemLoadingView()
}
