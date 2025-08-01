// Pokemon.swift
// By: Deepseek

import Foundation

enum ElementType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case grass
    case poison
    case fire
    case flying
    case water
    case bug
    case normal
    case electric
    case ground
    case fairy
    case psychic
    case rock
    case ice
    case dragon
    case dark
    case steel
    case fighting
    case ghost
    
    func getColor() -> Color {
        switch self {
        case .grass: return .green
        case .poison: return .purple
        case .fire: return .orange 
        case .flying: return .blue.opacity(0.8)
        case .water: return .blue
        case .bug: return .green.opacity(0.7)
        case .normal: return .gray
        case .electric: return .yellow
        case .ground: return .brown
        case .fairy: return .pink
        case .psychic: return .purple.opacity(0.8)
        case .rock: return .brown.opacity(0.8)
        case .ice: return .cyan
        case .dragon: return .indigo
        case .dark: return .black.opacity(0.8)
        case .steel: return .gray.opacity(0.7)
        case .fighting: return .red
        case .ghost: return .purple.opacity(0.6)
        }
    }
    
    func getLightColor() -> Color {
        return getColor().opacity(0.2)
    }
}

struct Pokemon: Identifiable {
    var id: Int
    var name: String
    var types: [ElementType]
    var url: String
    
    init(id: Int, name: String, types: [ElementType], url: String = "https://pokeres.bastionbot.org/images/pokemon/") {
        self.id = id
        self.name = name
        self.types = types
        self.url = url + String(id) + ".png"
    }
}

let pokemons: [Pokemon] = [
    Pokemon(id: 1, name: "bulbasaur", types: [.grass, .poison]),
    Pokemon(id: 2, name: "ivysaur", types: [.grass, .poison]),
    Pokemon(id: 3, name: "venusaur", types: [.grass, .poison]),
    Pokemon(id: 4, name: "charmander", types: [.fire]),
    Pokemon(id: 5, name: "charmeleon", types: [.fire]),
    Pokemon(id: 6, name: "charizard", types: [.fire, .flying]),
    Pokemon(id: 7, name: "squirtle", types: [.water]),
    Pokemon(id: 8, name: "wartortle", types: [.water]),
    Pokemon(id: 9, name: "blastoise", types: [.water]),
    Pokemon(id: 10, name: "caterpie", types: [.bug]),
    Pokemon(id: 11, name: "metapod", types: [.bug]),
    Pokemon(id: 12, name: "butterfree", types: [.bug, .flying]),
    Pokemon(id: 13, name: "weedle", types: [.bug, .poison]),
    Pokemon(id: 14, name: "kakuna", types: [.bug, .poison]),
    Pokemon(id: 15, name: "beedrill", types: [.bug, .poison]),
    Pokemon(id: 16, name: "pidgey", types: [.normal, .flying]),
    Pokemon(id: 17, name: "pidgeotto", types: [.normal, .flying]),
    Pokemon(id: 18, name: "pidgeot", types: [.normal, .flying]),
    Pokemon(id: 19, name: "rattata", types: [.normal]),
    Pokemon(id: 20, name: "raticate", types: [.normal]),
    Pokemon(id: 21, name: "spearow", types: [.normal, .flying]),
    Pokemon(id: 22, name: "fearow", types: [.normal, .flying]),
    Pokemon(id: 23, name: "ekans", types: [.poison]),
    Pokemon(id: 24, name: "arbok", types: [.poison]),
    Pokemon(id: 25, name: "pikachu", types: [.electric]),
    Pokemon(id: 26, name: "raichu", types: [.electric]),
    Pokemon(id: 27, name: "sandshrew", types: [.ground]),
    Pokemon(id: 28, name: "sandslash", types: [.ground]),
    Pokemon(id: 29, name: "nidoran-f", types: [.poison]),
    Pokemon(id: 30, name: "nidorina", types: [.poison]),
    Pokemon(id: 31, name: "nidoqueen", types: [.poison, .ground]),
    Pokemon(id: 32, name: "nidoran-m", types: [.poison]),
    Pokemon(id: 33, name: "nidorino", types: [.poison]),
    Pokemon(id: 34, name: "nidoking", types: [.poison, .ground]),
    Pokemon(id: 35, name: "clefairy", types: [.fairy]),
    Pokemon(id: 36, name: "clefable", types: [.fairy]),
    Pokemon(id: 37, name: "vulpix", types: [.fire]),
    Pokemon(id: 38, name: "ninetales", types: [.fire]),
    Pokemon(id: 39, name: "jigglypuff", types: [.normal, .fairy]),
    Pokemon(id: 40, name: "wigglytuff", types: [.normal, .fairy]),
    Pokemon(id: 41, name: "zubat", types: [.poison, .flying]),
    Pokemon(id: 42, name: "golbat", types: [.poison, .flying]),
    Pokemon(id: 43, name: "oddish", types: [.grass, .poison]),
    Pokemon(id: 44, name: "gloom", types: [.grass, .poison]),
    Pokemon(id: 45, name: "vileplume", types: [.grass, .poison]),
    Pokemon(id: 46, name: "paras", types: [.bug, .grass]),
    Pokemon(id: 47, name: "parasect", types: [.bug, .grass]),
    Pokemon(id: 48, name: "venonat", types: [.bug, .poison]),
    Pokemon(id: 49, name: "venomoth", types: [.bug, .poison]),
    Pokemon(id: 50, name: "diglett", types: [.ground]),
    Pokemon(id: 51, name: "dugtrio", types: [.ground]),
    Pokemon(id: 52, name: "meowth", types: [.normal]),
    Pokemon(id: 53, name: "persian", types: [.normal]),
    Pokemon(id: 54, name: "psyduck", types: [.water]),
    Pokemon(id: 55, name: "golduck", types: [.water]),
    Pokemon(id: 56, name: "mankey", types: [.fighting]),
    Pokemon(id: 57, name: "primeape", types: [.fighting]),
    Pokemon(id: 58, name: "growlithe", types: [.fire]),
    Pokemon(id: 59, name: "arcanine", types: [.fire]),
    Pokemon(id: 60, name: "poliwag", types: [.water]),
    Pokemon(id: 61, name: "poliwhirl", types: [.water]),
    Pokemon(id: 62, name: "poliwrath", types: [.water, .fighting]),
    Pokemon(id: 63, name: "abra", types: [.psychic]),
    Pokemon(id: 64, name: "kadabra", types: [.psychic]),
    Pokemon(id: 65, name: "alakazam", types: [.psychic]),
    Pokemon(id: 66, name: "machop", types: [.fighting]),
    Pokemon(id: 67, name: "machoke", types: [.fighting]),
    Pokemon(id: 68, name: "machamp", types: [.fighting]),
    Pokemon(id: 69, name: "bellsprout", types: [.grass, .poison]),
    Pokemon(id: 70, name: "weepinbell", types: [.grass, .poison]),
    Pokemon(id: 71, name: "victreebel", types: [.grass, .poison]),
    Pokemon(id: 72, name: "tentacool", types: [.water, .poison]),
    Pokemon(id: 73, name: "tentacruel", types: [.water, .poison]),
    Pokemon(id: 74, name: "geodude", types: [.rock, .ground]),
    Pokemon(id: 75, name: "graveler", types: [.rock, .ground]),
    Pokemon(id: 76, name: "golem", types: [.rock, .ground]),
    Pokemon(id: 77, name: "ponyta", types: [.fire]),
    Pokemon(id: 78, name: "rapidash", types: [.fire]),
    Pokemon(id: 79, name: "slowpoke", types: [.water, .psychic]),
    Pokemon(id: 80, name: "slowbro", types: [.water, .psychic]),
    Pokemon(id: 81, name: "magnemite", types: [.electric, .steel]),
    Pokemon(id: 82, name: "magneton", types: [.electric, .steel]),
    Pokemon(id: 83, name: "farfetchd", types: [.normal, .flying]),
    Pokemon(id: 84, name: "doduo", types: [.normal, .flying]),
    Pokemon(id: 85, name: "dodrio", types: [.normal, .flying]),
    Pokemon(id: 86, name: "seel", types: [.water]),
    Pokemon(id: 87, name: "dewgong", types: [.water, .ice]),
    Pokemon(id: 88, name: "grimer", types: [.poison]),
    Pokemon(id: 89, name: "muk", types: [.poison]),
    Pokemon(id: 90, name: "shellder", types: [.water]),
    Pokemon(id: 91, name: "cloyster", types: [.water, .ice]),
    Pokemon(id: 92, name: "gastly", types: [.ghost, .poison]),
    Pokemon(id: 93, name: "haunter", types: [.ghost, .poison]),
    Pokemon(id: 94, name: "gengar", types: [.ghost, .poison]),
    Pokemon(id: 95, name: "onix", types: [.rock, .ground]),
    Pokemon(id: 96, name: "drowzee", types: [.psychic]),
    Pokemon(id: 97, name: "hypno", types: [.psychic]),
    Pokemon(id: 98, name: "krabby", types: [.water]),
    Pokemon(id: 99, name: "kingler", types: [.water]),
    Pokemon(id: 100, name: "voltorb", types: [.electric]),
    Pokemon(id: 101, name: "electrode", types: [.electric]),
    Pokemon(id: 102, name: "exeggcute", types: [.grass, .psychic]),
    Pokemon(id: 103, name: "exeggutor", types: [.grass, .psychic]),
    Pokemon(id: 104, name: "cubone", types: [.ground]),
    Pokemon(id: 105, name: "marowak", types: [.ground]),
    Pokemon(id: 106, name: "hitmonlee", types: [.fighting]),
    Pokemon(id: 107, name: "hitmonchan", types: [.fighting]),
    Pokemon(id: 108, name: "lickitung", types: [.normal]),
    Pokemon(id: 109, name: "koffing", types: [.poison]),
    Pokemon(id: 110, name: "weezing", types: [.poison]),
    Pokemon(id: 111, name: "rhyhorn", types: [.ground, .rock]),
    Pokemon(id: 112, name: "rhydon", types: [.ground, .rock]),
    Pokemon(id: 113, name: "chansey", types: [.normal]),
    Pokemon(id: 114, name: "tangela", types: [.grass]),
    Pokemon(id: 115, name: "kangaskhan", types: [.normal]),
    Pokemon(id: 116, name: "horsea", types: [.water]),
    Pokemon(id: 117, name: "seadra", types: [.water]),
    Pokemon(id: 118, name: "goldeen", types: [.water]),
    Pokemon(id: 119, name: "seaking", types: [.water]),
    Pokemon(id: 120, name: "staryu", types: [.water]),
    Pokemon(id: 121, name: "starmie", types: [.water, .psychic]),
    Pokemon(id: 122, name: "mr-mime", types: [.psychic, .fairy]),
    Pokemon(id: 123, name: "scyther", types: [.bug, .flying]),
    Pokemon(id: 124, name: "jynx", types: [.ice, .psychic]),
    Pokemon(id: 125, name: "electabuzz", types: [.electric]),
    Pokemon(id: 126, name: "magmar", types: [.fire]),
    Pokemon(id: 127, name: "pinsir", types: [.bug]),
    Pokemon(id: 128, name: "tauros", types: [.normal]),
    Pokemon(id: 129, name: "magikarp", types: [.water]),
    Pokemon(id: 130, name: "gyarados", types: [.water, .flying]),
    Pokemon(id: 131, name: "lapras", types: [.water, .ice]),
    Pokemon(id: 132, name: "ditto", types: [.normal]),
    Pokemon(id: 133, name: "eevee", types: [.normal]),
    Pokemon(id: 134, name: "vaporeon", types: [.water]),
    Pokemon(id: 135, name: "jolteon", types: [.electric]),
    Pokemon(id: 136, name: "flareon", types: [.fire]),
    Pokemon(id: 137, name: "porygon", types: [.normal]),
    Pokemon(id: 138, name: "omanyte", types: [.rock, .water]),
    Pokemon(id: 139, name: "omastar", types: [.rock, .water]),
    Pokemon(id: 140, name: "kabuto", types: [.rock, .water]),
    Pokemon(id: 141, name: "kabutops", types: [.rock, .water]),
    Pokemon(id: 142, name: "aerodactyl", types: [.rock, .flying]),
    Pokemon(id: 143, name: "snorlax", types: [.normal]),
    Pokemon(id: 144, name: "articuno", types: [.ice, .flying]),
    Pokemon(id: 145, name: "zapdos", types: [.electric, .flying]),
    Pokemon(id: 146, name: "moltres", types: [.fire, .flying]),
    Pokemon(id: 147, name: "dratini", types: [.dragon]),
    Pokemon(id: 148, name: "dragonair", types: [.dragon]),
    Pokemon(id: 149, name: "dragonite", types: [.dragon, .flying]),
    Pokemon(id: 150, name: "mewtwo", types: [.psychic]),
    Pokemon(id: 151, name: "mew", types: [.psychic])
]
