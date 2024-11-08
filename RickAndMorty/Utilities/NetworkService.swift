//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import Foundation

protocol NetworkServiceProtocol {
    
}

final class NetworkService: NetworkServiceProtocol {
    
    func fetchManufacturers(page: Int) async throws -> PageDataModel {
        guard let url = API.Endpoint.character(page: page).url() else {
            throw URLError(.badURL)
        }
        //print(">>> \(url)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        
        /*
        if let str = String(data: data, encoding: .utf8) {
            print(">>> Decoded:\n\(str)")
        }*/
        
        do {
            return try JSONDecoder().decode(PageDataModel.self, from: data)
        } catch {
            throw error
        }
    }
    
}
