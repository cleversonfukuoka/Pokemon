//
//  SideMenuLayout.swift
//  Pokemon
//
//  Created by Cleverson Fukuoka on 06/05/25.
//

import SwiftUI

struct SideMenuLayout<Content: View>: View {
    @State private var showMenu = false
    let content: () -> Content

    var body: some View {
        NavigationView {
            ZStack {
                content()
                    .blur(radius: showMenu ? 5 : 0)
                    .disabled(showMenu)

                if showMenu {
                    VStack(alignment: .leading, spacing: 16) {
                        Button("Sobre o app") { }
                        Button("Configurações") { }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.systemGray6))
                    .transition(.move(edge: .leading))
                }
            }
            .navigationBarTitle("Pokémon", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                withAnimation { showMenu.toggle() }
            }) {
                Image(systemName: "line.3.horizontal")
                    .imageScale(.large)
            })
        }
    }
}
