//
//  FetchService.swift
//  Pokemon
//
//  Created by Cleverson Fukuoka on 05/05/25.
//

import Foundation

struct FetchService {
    private enum FetchError: Error {
        case badResponse
    }
    
    private let baseURL = URL(string: "https://pokeapi.co/api/v2")!
    
    func fetchPokemonList() async throws -> [PokemonEntry] {
        let endpoint = baseURL.appendingPathComponent("pokemon")
        var components = URLComponents(url: endpoint, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            URLQueryItem(name: "limit", value: "10")
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(PokemonListResponse.self, from: data)
        return decoded.results
    }

    func fetchPokemonDetails(from url: String) async throws -> Pokemon {
        let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
        return try JSONDecoder().decode(Pokemon.self, from: data)
    }

}
