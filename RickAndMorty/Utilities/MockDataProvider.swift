//
//  MockDataProvider.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import Foundation

enum MockDataProvider {
    
    static let characterRickSanchez = Character(
        id: 1,
        name: "Rick Sanchez",
        status: .alive,
        species: "Alien",
        type: "",
        gender: .male,
        origin: Location(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
        location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: ["https://rickandmortyapi.com/api/episode/1",
                  "https://rickandmortyapi.com/api/episode/2"],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z")
    
    static let errorBadURL = "The operation couldn't be completed.\nNSURLErrorDomain error -1011."
    
    
    
}
