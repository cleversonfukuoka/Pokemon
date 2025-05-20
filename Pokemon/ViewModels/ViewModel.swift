//
//  ViewModel.swift
//  Pokemon
//
//  Created by Cleverson Fukuoka on 05/05/25.
//


import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case successPokemon
        case failed(error: Error)
    }
    
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var pokemon: [Pokemon] = []
  
    func getPokemonData() async {
            status = .fetching

            do {
                let entries = try await fetcher.fetchPokemonList()
                
                // Busca os detalhes paralelamente
                let details = try await withThrowingTaskGroup(of: Pokemon.self) { group -> [Pokemon] in
                    for entry in entries {
                        group.addTask {
                            return try await self.fetcher.fetchPokemonDetails(from: entry.url)
                        }
                    }
                    
                    var result: [Pokemon] = []
                    for try await detail in group {
                        result.append(detail)
                    }
                    return result
                }
                
                pokemon = details                                
                status = .successPokemon

            } catch {
                status = .failed(error: error)
            }
        }
}
