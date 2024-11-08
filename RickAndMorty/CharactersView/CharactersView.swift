//
//  ContentView.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import SwiftUI
import ComposableArchitecture

struct CharactersView: View {
    
    let store: StoreOf<CharactersFeature>
        
    var body: some View {
        NavigationStack {
            Group {
                switch store.viewState {
                case .emptyList:
                    LoadingView()
                    
                case .content(let characters):
                    List(characters) { character in
                        WithPerceptionTracking {
                            NavigationLink {
                                CharactersDetailsView(character: character)
                            } label: {
                                CharacterListItemView(character: character)
                            }
                            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 12))
                            
                            if shouldDisplayProgressRow(for: character) {
                                CharacterListItemLoadingView()
                                    .onAppear {
                                        Task { store.send(.didScrollToBottom) }
                                    }
                            }
                        }
                    }
                    .listRowSpacing(6)
                    
                case .error(let error):
                    ErrorView(description: error)
                }
            }
            .navigationTitle("Characters")
            .onAppear {
                Task { store.send(.start) }
            }
        }
    }
    
    private func shouldDisplayProgressRow(for character: Character) -> Bool {
        if store.characters.last?.id == character.id &&
            store.currentPage < store.totalPageCount {
            return true
        }
        return false
    }
}

#Preview {
    CharactersView(
        store: Store(initialState: CharactersFeature.State()) {
            CharactersFeature()
        }
    )
}
