//
//  StatisticsView.swift
//  Pokedex
//
//  Created by Aluno Mack on 29/07/25.
//

import SwiftUI

struct StatisticsView: View {
    let pokemon: Pokemon
    
    var primaryType: ElementType {
        pokemon.types.first ?? .normal
    }
    
    var formattedId: String {
        String(format: "%03d", pokemon.id)
    }
    
    var pokemonImageUrl: String {
        "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/\(formattedId).png"
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    AsyncImage(url: URL(string: pokemonImageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 200, height: 200)
                    }
                    
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
                .background(primaryType.getColor())
                
                VStack(spacing: 20) {
                    VStack(spacing: 4) {
                        Text("POKÉDEX Nº")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("#\(formattedId)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(primaryType.getColor())
                    }
                    
                    Divider()

                    VStack(spacing: 12) {
                        Text("TIPOS")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        HStack(spacing: 12) {
                            ForEach(pokemon.types, id: \.self) { type in
                                Text(type.rawValue.capitalized)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(type.getColor())
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                        }
                    }
                }
                .padding(24)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal, 20)
                
                VStack(spacing: 16) {
                    Text("ESTATÍSTICAS BASE")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                    
                    VStack(spacing: 12) {
                        statRow(name: "HP", value: 45)
                        statRow(name: "ATAQUE", value: 49)
                        statRow(name: "DEFESA", value: 49)
                        statRow(name: "AT. ESP.", value: 65)
                        statRow(name: "DEF. ESP.", value: 65)
                        statRow(name: "VELOCIDADE", value: 45)
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                }
                
                Spacer(minLength: 50)
            }
        }
        .background(LinearGradient(
            colors: [primaryType.getColor(), Color.white],
            startPoint: .top,
            endPoint: .center
        ))
        .navigationBarTitleDisplayMode(.inline)
    }

    func statRow(name: String, value: Int) -> some View {
        HStack {
            Text(name)
                .font(.caption)
                .fontWeight(.medium)
                .frame(width: 80, alignment: .leading)
            
            Text("\(value)")
                .font(.caption)
                .fontWeight(.bold)
                .frame(width: 30, alignment: .trailing)
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 8)
                    .cornerRadius(4)
                
                Rectangle()
                    .fill(primaryType.getColor())
                    .frame(width: CGFloat(value) * 1.5, height: 8)
                    .cornerRadius(4)
            }
        }
    }
}

#Preview {
    NavigationView {
        StatisticsView(pokemon: Pokemon(id: 1, name: "bulbasaur", types: [.grass, .poison]))
    }
}