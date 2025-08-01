//
//  ContentView.swift
//  Pokedex
//
//  Created by Aluno Mack on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab:Int = 0
    @State var selectedPokemon: Pokemon?
    
    var body: some View {
        TabView  {
            PokedexView()
                .tabItem {
                    Label("Pokedex", systemImage: "magazine.fill")
                }.tag(0)
            
            StatisticsView(pokemon: selectedPokemon ?? Pokemon(id:0,name: "dd",types: [ElementType.normal]))
                .tabItem {
                    Label("Estatísticas", systemImage: "chart.xyaxis.line")
                }.tag(1)
        }
    }
}

#Preview {
    ContentView()
}
