//
//  PokedexView.swift
//  Pokedex
//
//  Created by Aluno Mack on 29/07/25.
//

import SwiftUI

struct PokedexView: View {
    @State private var searchText = ""
    @State private var selectedType: ElementType? = nil
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var filteredPokemons: [Pokemon] {
        pokemons.filter { pokemon in
            let matchesSearch = searchText.isEmpty || pokemon.name.localizedCaseInsensitiveContains(searchText)
            let matchesType = selectedType == nil || pokemon.types.contains(selectedType!)
            return matchesSearch && matchesType
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Buscar Pokémon...", text: $searchText)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            Button(action: { selectedType = nil }) {
                                Text("Todos")
                                    .font(.caption.weight(.medium))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedType == nil ? Color.blue : Color.gray.opacity(0.2))
                                    .foregroundColor(selectedType == nil ? .white : .primary)
                                    .cornerRadius(20)
                            }
                            
                            ForEach(ElementType.allCases, id: \.self) { type in
                                Button(action: { 
                                    selectedType = selectedType == type ? nil : type 
                                }) {
                                    Text(type.rawValue.capitalized)
                                        .font(.caption.weight(.medium))
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(selectedType == type ? type.color : type.lightColor)
                                        .foregroundColor(selectedType == type ? .white : type.color)
                                        .cornerRadius(20)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                .background(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredPokemons) { pokemon in
                            NavigationLink(destination: StatisticsView(pokemon: pokemon)) {
                                PokemonCard(pokemon: pokemon)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Pokédex")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct PokemonCard: View {
    let pokemon: Pokemon
    
    var primaryType: ElementType {
        pokemon.types.first ?? .normal
    }
    
    var body: some View {
        VStack(spacing: 12) {
            AsyncImage(url: URL(string: pokemon.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
            } placeholder: {
                ProgressView()
                    .frame(width: 120, height: 120)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(60)
            }

            Text("#\(String(format: "%03d", pokemon.id))")
                .font(.caption2)
                .foregroundColor(.secondary)

            Text(pokemon.name.capitalized)
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            HStack(spacing: 6) {
                ForEach(pokemon.types, id: \.self) { type in
                    Text(type.rawValue.capitalized)
                        .font(.caption2)
                        .fontWeight(.medium)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(type.getColor())
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
        }
        .padding(16)
        .background(
            LinearGradient(
                colors: [primaryType.getLightColor(), Color.white],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .shadow(color: primaryType.getColor().opacity(0.3), radius: 8, x: 0, y: 4)
        .scaleEffect(1.0)
        .animation(.easeInOut(duration: 0.2), value: pokemon.id)
    }
}

#Preview {
    PokedexView()
}