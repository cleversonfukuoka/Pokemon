//
//  SampleData.swift
//  Pokemon
//
//  Created by Cleverson Fukuoka on 07/05/25.
//

import Foundation

extension Pokemon {
    static let sample = Pokemon(
        id: 25,
        name: "Pikachu",
        sprites: Sprites(
            other: OtherSprites(
                officialArtwork: OfficialArtwork(
                    frontDefault: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
                )
            )
        )
    )
}
