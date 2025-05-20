//
//  PokemonCover.swift
//  Pokemon
//
//  Created by Cleverson Fukuoka on 05/05/25.
//

import Foundation

struct PokemonCover {
    private let baseImage = ""
    private let extensionImage = ".png"
    let indexImage: Int
    var image: URL? {
        URL(string: String(baseImage + String(indexImage) + extensionImage))
    }
}
