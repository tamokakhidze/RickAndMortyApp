//
//  EpisodeModel.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import Foundation

struct EpisodesInfo: Codable {
    let results: [Episode]
}

struct Episode: Codable, Identifiable, Searchable {
    var id: Int
    var image: String? = nil
    var name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
}
