//
//  ContentView.swift
//  Pokemon
//
//  Created by Cleverson Fukuoka on 05/05/25.
//

import SwiftUI

struct ContentView: View {
    @Bindable var vm = ViewModel()
    var body: some View {
        SideMenuLayout {
            PokemonCarouselView(pokemons: vm.pokemon)
        }
        .task {
            await vm.getPokemonData()
        }
        .background(Image("Background").resizable().ignoresSafeArea())
    }
    
}

#Preview {
    ContentView()
}
