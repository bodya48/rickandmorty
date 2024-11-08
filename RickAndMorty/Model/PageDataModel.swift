//
//  PageDataModel.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import Foundation

struct PageDataModel: Codable {
    let info: Info
    let results: [Character]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

