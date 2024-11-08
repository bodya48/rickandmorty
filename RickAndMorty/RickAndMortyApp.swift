//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct RickAndMortyApp: App {
    
    static let store = Store(initialState: CharactersFeature.State()) {
        CharactersFeature()
            //._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CharactersView(store: RickAndMortyApp.store)
        }
    }
}
