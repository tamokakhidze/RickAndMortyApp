//
//  DetailsViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import Foundation
import NetworkServicePackage

class DetailsViewViewModel: ObservableObject {
    
    @Published var character: Character?
    @Published var episodesArray = [Episode]()
    
    func loadCharacter(characterId: Int) {
        let url = "https://rickandmortyapi.com/api/character/\(characterId)"
        print(characterId)
        fetchCharacterData(url: url) { [weak self] result in
            switch result {
            case .success(let success):
                self?.character = success
                self?.character?.episode.forEach { episodeUrl in
                    self?.loadEpisodes(url: episodeUrl)
                }
            case .failure(let failure):
                print("fetching failed. \(failure)")
            }
        }
    }
    
    func loadEpisodes(url: String) {
        fetchEpisodesData(url: url) { [weak self] result in
            switch result {
            case .success(let success):
                self?.episodesArray.append(success)
            case .failure(let failure):
                print("fetching failed. \(failure)")
            }
        }
    }
    
    func fetchCharacterData(url: String, completion: @escaping (Result<Character,Error>) ->(Void)){
        NetworkService().getData(urlString: url, completion: completion)
    }
    
    func fetchEpisodesData(url: String, completion: @escaping (Result<Episode,Error>) ->(Void)){
        NetworkService().getData(urlString: url, completion: completion)
    }
}
