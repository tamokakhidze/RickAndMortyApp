//
//  CharacterModel.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

struct CharacterInfo: Decodable {
    let results: [Character]
}

struct Character: Identifiable, Hashable, Decodable, Searchable {    
    var id: Int
    var name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    var image: String?
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Hashable, Decodable {
    let name: String
    let url: String
}
