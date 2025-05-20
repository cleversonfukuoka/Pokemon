import SwiftUI

struct FetchView: View {
    @Bindable var vm: ViewModel
    let show: String

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(red: 246/255, green: 201/255, blue: 19/255)

                VStack {
                    Text("Lista de Pokémon")
                        .font(.title2).bold()
                        .padding(.top)

                    switch vm.status {
                    case .fetching:
                        ProgressView("Carregando...").padding()

                    case .successPokemon:
                        List(vm.pokemon) { pokemon in
                            HStack {
                                AsyncImage(url: pokemon.sprites.other.officialArtwork.frontDefault) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                    case .failure:
                                        Image(systemName: "xmark.octagon")
                                            .foregroundColor(.red)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }

                                Text(pokemon.name.capitalized)
                                    .font(.headline)
                            }
                        }

                    case .failed(let error):
                        Text("Erro ao carregar: \(error.localizedDescription)")
                            .foregroundColor(.red)

                    case .notStarted:
                        Text("Aguardando início...")
                    }
                }
            }
        }
    }
}
