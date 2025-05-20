import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @Environment(\.presentationMode) var presentationMode
    @State private var onAppear = false

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                // Botão Voltar
                HStack(alignment: .top) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 24, height: 40)
                        .padding()
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }

                // ID do Pokémon no fundo
                HStack {
                    VStack {
                        Spacer()
                        Text("Pikachu")
                            .font(.system(size: 100))
                            .bold()
                            .opacity(0.1)
                            .padding(.leading, 30)
                    }
                    Spacer()
                }

                // Imagem principal
                AsyncImage(url: pokemon.sprites.other.officialArtwork.frontDefault) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 500, height: 500)
                            .padding(.top, -150)
                            .padding(.trailing, -270)
                            .shadow(radius: 10)
                            .scaleEffect(onAppear ? 1 : 0)
                            .animation(.easeInOut(duration: 2), value: onAppear)
                    case .failure:
                        Image(systemName: "xmark.octagon")
                            .resizable()
                            .frame(width: 100, height: 100)
                    @unknown default:
                        EmptyView()
                    }
                }
                .zIndex(3.0)
            }
            .frame(height: 360)

            // Informações
            VStack(alignment: .leading, spacing: 16) {
                Text(pokemon.name.capitalized)
                    .font(.system(size: 50))
                    .bold()

                Text("Este é o Pokémon número \(pokemon.id).")
                    .font(.system(size: 18))
                    .lineSpacing(5.0)
                    .zIndex(2.0)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)

            Spacer()

            // Seção simulando vídeo
            ZStack {
                RoundedRectangle(cornerRadius: 40.0)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 195)
                    .padding(.horizontal, 30)
                    .opacity(0.9)
                    .zIndex(1.0)
                    .shadow(color: .blue, radius: 20)

                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 80, height: 80)
                    .zIndex(3.0)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            onAppear = true
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: .sample)
}
