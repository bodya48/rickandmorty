//
//  ApiHelper.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import Foundation

struct API {
    static let baseURL = URL(string: "https://rickandmortyapi.com/api")!
    
    enum Endpoint {
        case character(page: Int)
        case details(id: Int)
        
        var path: String {
            switch self {
            case .character:
                return "/character"
            case .details(let id):
                return "/character/\(id)"
            }
        }
        
        var queryItems: [URLQueryItem]? {
            switch self {
            case .character(let page):
                return [
                    URLQueryItem(name: "page", value: "\(page)")
                ]
            case .details:
                return []
            }
        }
        
        func url() -> URL? {
            var urlComponents = URLComponents(url: API.baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            urlComponents?.queryItems = queryItems
            return urlComponents?.url
        }
    }
}
