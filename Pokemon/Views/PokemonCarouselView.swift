//
//  PokemonCarouselView.swift
//  Pokemon
//
//  Created by Cleverson Fukuoka on 06/05/25.
//
import SwiftUI

struct PokemonCarouselView: View {
    let pokemons: [Pokemon]

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                if pokemons.isEmpty {
                                ProgressView("Carregando pokémons...")
                                    .foregroundColor(.white)
                                    .padding()
                } else {
                    Text("Pokemon")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack (spacing:16){
                            ForEach(pokemons) { pokemon in
                                NavigationLink {
                                    PokemonDetailView(pokemon: pokemon)
                                } label: {
                                    PokemonCardView(pokemon: pokemon)
                                        .padding(.horizontal)
                                        .frame(width: 270)
                                        .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                            content
                                                .opacity(phase.isIdentity ? 1.0 : 0.8)
                                                .scaleEffect(phase.isIdentity ? 1.0 : 0.4)
                                        }
                                        .padding(.horizontal,8)
                                }
                                buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 32)
                        .frame(height: proxy.size.height)
                    }
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
        
    }

    private func getScale(geo: GeometryProxy, screenWidth: CGFloat) -> CGFloat {
        let midX = geo.frame(in: .global).midX
        let diff = abs(screenWidth / 2 - midX)
        return max(0.85, 1 - (diff / screenWidth))
    }
}

#Preview {
    NavigationView {
        PokemonCarouselView(pokemons: [
            .sample,
            .sample,
            .sample
        ])
    }
}
