//
//  PokemonCardView.swift
//  Pokemon
//
//  Created by Cleverson Fukuoka on 06/05/25.
//

import SwiftUI

extension Color {
    static let pokemonYellow = Color(red: 246/255, green: 201/255, blue: 19/255)
}

import SwiftUI

struct PokemonCardView: View {
    let pokemon: Pokemon

    var body: some View {
        ZStack {
            VStack(spacing: -70) {
                // Pokémon Image
                AsyncImage(url: pokemon.sprites.other.officialArtwork.frontDefault) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 250, height: 250)
                            .shadow(color: .yellow.opacity(0.6), radius: 20)
                            .offset(x: 50)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 150, height: 150)
                    @unknown default:
                        EmptyView()
                    }
                }
                .zIndex(1.0)

                // Info box
                VStack(alignment: .leading, spacing: 14) {
                    Text(pokemon.name.capitalized)
                        .font(.title)
                        .bold()
                        .padding(.top, 20)

                    Text("Texto2")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineSpacing(6.0)
                        .zIndex(2.0)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 70)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))

                // Placeholder for "more" icon
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                    .zIndex(1.0)
            }

            // Pokémon ID as background number
            HStack {
                Spacer()
                //Text("Pokemon")
                //    .font(.system(size: 80))
                //    .bold()
                //    .padding(.trailing, 20)
                //    .opacity(0.1)
                //    .foregroundColor(Color.white)
            }
        }
        .background(Color.clear)
    }
}



#Preview {
    PokemonCardView(pokemon: .sample)
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.black)
}

